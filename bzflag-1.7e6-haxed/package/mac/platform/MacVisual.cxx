#include "MacVisual.h"

MacVisual::MacVisual (const MacDisplay *_display) {

    display = _display;
    pixel_format = NULL;
    attributes.reserve (65);
}

int MacVisual::findAttribute (GLint attribute) {

    for (int i = 0; i < attributes.size(); i++)
	if (attributes[i] == attribute)
	    return i;
    return -1;
}

void MacVisual::addAttribute1 (GLint attribute) {

    int index = findAttribute(attribute);
    int size  = attributes.size();
    if (index == -1) {

	if (size > 0)
	  attributes[size-1] = attribute;
	else
	  attributes.push_back (attribute);

	attributes.push_back (AGL_NONE);
     }
     else
	attributes[index] = attribute;
}

void MacVisual::addAttribute2 (GLint attribute, int value) {

    int index = findAttribute(attribute);
    int size  = attributes.size();
    if (index == -1) {

	if (size > 0)
	  attributes[size-1] = attribute;
	else
	  attributes.push_back(attribute);

	attributes.push_back(value);
	attributes.push_back(AGL_NONE);
    }
    else
	attributes[index+1] = value;
}

void MacVisual::removeAttribute1 (GLint attribute) {

    int index = findAttribute (attribute);
    if ( index == -1)
	return;
    else {

	for (int i = index; i < attributes.size ()-1; i++)
	    attributes[i] = attributes[i+1];

	 attributes.pop_back ();
    }
}

void MacVisual::removeAttribute2 (GLint attribute) {

    int index = findAttribute (attribute);
    if ( index == -1)
	return;
    else {
	for (int i = index; i < attributes.size ()-2; i++)
	    attributes[i] = attributes[i+2];

	 attributes.pop_back ();
	 attributes.pop_back ();
    }
}

void MacVisual::setLevel (int level) {

    addAttribute2 (AGL_LEVEL, level);
}

void MacVisual::setDoubleBuffer(boolean dbl_buffer) {

    if (dbl_buffer)
	addAttribute1(AGL_DOUBLEBUFFER);
    else
	removeAttribute1(AGL_DOUBLEBUFFER);
}


void MacVisual::setIndex (int depth) {

    if (depth < 0) return;
    addAttribute2 (AGL_DEPTH_SIZE, depth);
}

void MacVisual::setRGBA (int r, int g, int b, int a) {

    if (r < 0 || g < 0 || b < 0 || a < 0) return;

    addAttribute1(AGL_RGBA);
 //   addAttribute2(AGL_RED_SIZE,   r);
 //   addAttribute2(AGL_GREEN_SIZE, g);
 //   addAttribute2(AGL_BLUE_SIZE,  b);
 //   addAttribute2(AGL_ALPHA_SIZE, a);
 addAttribute2(AGL_ALPHA_SIZE, 1);
}

void MacVisual::setDepth (int value) {

    if (value < 0) return;

    if (findAttribute (AGL_RGBA) != -1) // indexed color is ignored if AGL_RGBA is present
	addAttribute2(AGL_BUFFER_SIZE, value);
}

void MacVisual::setStencil (int value) {

    if (value < 0) return;
    addAttribute2(AGL_STENCIL_SIZE, value);
}

void MacVisual::setAccum (int r, int g, int b, int a) {

    if (r < 0 || g < 0 || b < 0 || a < 0) return;

    addAttribute2(AGL_ACCUM_RED_SIZE,   r);
    addAttribute2(AGL_ACCUM_GREEN_SIZE, g);
    addAttribute2(AGL_ACCUM_BLUE_SIZE,  b);
    addAttribute2(AGL_ACCUM_ALPHA_SIZE, a);
}

void MacVisual::setStereo (boolean stereo) {

    if (stereo)
	addAttribute1 (AGL_STEREO);
    else
	removeAttribute1 (AGL_STEREO);
}

boolean MacVisual::build () {

 // GLint attrib[] = { AGL_DOUBLEBUFFER, AGL_RGBA, AGL_DEPTH_SIZE, 24, AGL_NONE };
    GLint *attrib = new GLint[attributes.size()];
    for (int i = 0; i < attributes.size(); i++)
	attrib[i] = attributes[i];

   if (pixel_format == NULL) {
      pixel_format = aglChoosePixelFormat (NULL, 0, attrib);
      delete attrib;
   }
   else {
     aglDestroyPixelFormat(pixel_format);
     pixel_format = aglChoosePixelFormat (NULL, 0, attrib);
     delete attrib;
    }

  return true;
}

void MacVisual::setMultisample (int value) {

    // I couldn't find this attribute in agl docs
    return;
}
// ex: shiftwidth=2 tabstop=8
