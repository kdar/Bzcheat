/* bzflag
 * Copyright (c) 1993 - 2002 Tim Riker
 *
 * This package is free software;  you can redistribute it and/or
 * modify it under the terms of the license found in the file
 * named LICENSE that should have accompanied this file.
 *
 * THIS PACKAGE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/* PhotonTorpedoSceneNode:
 *	Encapsulates information for rendering a photon torpedo-ish
 *	object.
 */

#ifndef	BZF_PHOTON_TORPEDO_SCENE_NODE_H
#define	BZF_PHOTON_TORPEDO_SCENE_NODE_H

#include "ShotSceneNode.h"
#include "OpenGLLight.h"

class PhotonTorpedoSceneNode : public ShotSceneNode {
  public:
			PhotonTorpedoSceneNode(const GLfloat pos[3]);
			~PhotonTorpedoSceneNode();

    void		move(const GLfloat pos[3], const GLfloat forward[3]);
    void		addLight(SceneRenderer&);

    void		notifyStyleChange(const SceneRenderer&);
    void		addRenderNodes(SceneRenderer&);

  protected:
    class PTRenderNode : public RenderNode {
      public:
			PTRenderNode(const PhotonTorpedoSceneNode*);
			~PTRenderNode();
	void		render();
	const GLfloat*	getPosition() { return sceneNode->getSphere(); }
      private:
	const PhotonTorpedoSceneNode* sceneNode;
	int		numFlares;
	float		theta[6];
	float		phi[6];

	static GLfloat	 core[9][2];
	static GLfloat	 corona[8][2];
	static const GLfloat ring[8][2];
    };
    friend class PTRenderNode;

  private:
    boolean		blending;
    OpenGLLight		light;
    OpenGLGState	gstate;
    PTRenderNode	renderNode;
    static const GLfloat CoreSize;
    static const GLfloat CoronaSize;
    static const GLfloat FlareSize;
    static const GLfloat FlareSpread;
};

#endif // BZF_PHOTON_TORPEDO_SCENE_NODE_H
// ex: shiftwidth=2 tabstop=8
