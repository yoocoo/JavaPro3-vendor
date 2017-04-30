
		function cmainFrame(){
			var hmain = document.getElementById("mainFrame");
			var bheight = document.documentElement.clientHeight;
			hmain .style.width = '100%';
			hmain .style.height = (bheight  - 51) + 'px';
			hmain.scolling = 'no';
			
		}
		cmainFrame();
		window.onresize=function(){  
			cmainFrame();
		};
