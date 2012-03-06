package
{
	import away3d.cameras.HoverCamera3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	
	import flash.display.*;
	
	//Wraps the engine interface into an easy to use and easy to replace class
	public class Engine
	{
		private var _scene:Scene3D;
		private var _camera:HoverCamera3D;
		private var _view:View3D;
		
		public function Engine()
		{
			
		}
		
		public function Initialize(x:int, y:int):View3D
		{
			//Create the new scene
			_scene = new Scene3D();
			
			//Create a new camera, this will need to be moved to its own class at some point
//			_camera = new HoverCamera3D({zoom:20, focus:30, x:0, y:5000, z:-9000});
			_camera = new HoverCamera3D({zoom:2, focus:200, x:0, y:400, z:-800, distance:-100, tiltAngle:-45 });
			
			//Create a new view
			_view = new View3D({scene:_scene, camera:_camera});
			
			//Start by centering the viewport
			_view.x = x/2;
			_view.y = y/2;
			return _view;
		}
		
		public function AddChild( displayObj:Object3D ):void
		{
			_scene.addChild( displayObj );
		}
		
		public function GetScene( ):Scene3D
		{
			return _scene;
		}
		
		public function Render( ):void
		{
			_camera.hover( true );
			_view.render( );
		}
		
		
	}
}