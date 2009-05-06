package {
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import org.papervision3d.core.proto.MaterialObject3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.view.BasicView;
	
	import com.as3dmod.ModifierStack;
	import com.as3dmod.plugins.pv3d.LibraryPv3d;
	import com.carlcalderon.arthropod.Debug;	

	public class Pv3dDemo extends BasicView {

		private var c:DisplayObject3D;
		private var m:ModifierStack;
		private var base:DemoBase;

		public function Pv3dDemo() {
			stage.quality = StageQuality.LOW;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.showDefaultContextMenu = false;
			stage.stageFocusRect = false;

			Debug.clear();
			
			base = new DemoBase();
			var mt:CompositeMaterial = new CompositeMaterial();
			mt.addMaterial(new ColorMaterial(0x27590e));
			mt.addMaterial(new WireframeMaterial(0x49a51c));
			mt.doubleSided = true;
			
			c = new Plane(mt, 1200, 500, 24, 10);
			c.rotationZ = 90;
			c.rotationY = 100;
			scene.addChild(c);
			
			
			
//			var ml:MaterialsList = new MaterialsList();
//			ml.addMaterial(wm, "all");
//			c.rotationY = 45;
			
			scene.addChild(c);
			
			m = new ModifierStack(new LibraryPv3d(), c);
			base.planeSetup(m);
			startRendering();
		}

		protected override function onRenderTick(event:Event = null):void {
			base.onRenderPlane();
			super.onRenderTick(event);
			m.apply();
			c.rotationY += 1;
		}
	}
}




