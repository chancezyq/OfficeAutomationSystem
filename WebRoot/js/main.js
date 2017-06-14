jQuery(function($){
    
     /**
     * Initialize zoombox on every link with zoombox class
     * http://www.grafikart.fr/zoombox - Developped by me 
     * */
     $('a.zoombox').zoombox({
         animation:false
     }); 
    
     /**
     * Slide toggle for blocs
     * */
     $('.bloc .title').append('<a href="#" class="toggle"></a>');
     $('.bloc .title .tabs').parent().find('.toggle').remove(); 
     $('.bloc .title .toggle').click(function(){
         $(this).toggleClass('hide').parent().parent().find('.content').slideToggle(300);
         return false; 
     });
     
     /**
      *  Visual Editor for textarea
      *  https://github.com/akzhan/jwysiwyg/
      * */
     $('.wysiwyg').wysiwyg({
        autoGrow: true,
        maxHeight: 600
     });
    
    /**
     * Tooltips on every links with a title not empty
     * http://tooltipsy.com/
     * */
     $('a[title!=""]').tooltipsy();
    
    /**
     * Create charts from table with "graph" class, Use graph-:type class to define chart type
     * http://www.filamentgroup.com/lab/update_to_jquery_visualize_accessible_charts_with_html5_from_designing_with/
     **/ 
     $('table.graph').each(function(){
         var matches = $(this).attr('class').split(/type\-(area|bar|pie|line)/g);
         var options = {
             height:'300px',
             width : parseInt($(this).width())-100,
             colors :['#c21c1c','#f1dc2b','#9ccc0a','#0accaa','#0a93cc','#8734c8','#26a4ed','#f45a90','#e9e744']
         };
         if(matches[1] != undefined){
             options.type = matches[1];
         }
         if($(this).hasClass('dots')){
           options.lineDots = 'double';
         }
          if($(this).hasClass('tips')){
            options.interaction =  true;
            options.multiHover  = 15,
            options.tooltip     =  true,
            options.tooltiphtml = function(data) {
                    var html ='';
                    for(var i=0; i<data.point.length; i++){
                            console.log(data.point); 
                            html += '<p class="stats_tooltip"><strong>'+data.point[i].value+'</strong> '+data.point[i].yLabels[0]+'</p>';
                    }	
                    return html;
           }
          }
          console.log(options); 
         $(this).hide().visualize(options);
     });

    
    /**
     * Animated Scroll for anchos
     * */
    $('a[href^="#"][href!="#"]').click(function() {
            cible=$(this).attr('href');
            if(cible=="#"){ return false; }
            scrollTo(cible);
            return false;
    });
    
    /**
     * iPhone Checkboxes on every input with "iphone" class
     * http://awardwinningfjords.com/2009/06/16/iphone-style-checkboxes.html
     * Triggers error on IE... Disabled waiting for a new version
     * */
    if(!$.browser.msie){
        $('.iphone').iphoneStyle({ checkedLabel: 'YES', uncheckedLabel: 'NO' });
    }
    
    /**
     * Jquery UI 
     * Automate jQuery UI insertion (no need to add more code)(and unfirm)
     * input.datepicker become a datepicker
     * input.range become a slider (value is inserted in the input) 
    **/
    $("select,.input input:checkbox, input:radio, input:file").uniform();
   
    $( ".datepicker" ).datepicker();
    
    $('.range').each(function(){
        var cls = $(this).attr('class'); 
        var matches = cls.split(/([a-zA-Z]+)\-([0-9]+)/g);
        var options = {
            animate : true
        };
        var elem = $(this).parent(); 
        elem.append('<div class="uirange"></div>'); 
        for (i in matches) {
          i = i*1; 
          if(matches[i] == 'max'){
             options.max = matches[i+1] * 1
          }
          if(matches[i] == 'min'){
             options.min = matches[i+1] * 1
          }
        }
        options.slide = function(event,ui){
             elem.find('span:first').empty().append(ui.value);
             elem.find('input:first').val(ui.value); 
        }
        elem.find('span:first').empty().append(elem.find('input:first').val());
        options.range = 'min';
        options.value = elem.find('input:first').val();
        elem.find('.uirange').slider(options);
        $(this).hide(); 
    });

   
    /**
     * Autohide errors when an input with error is focused
     * */
    $('.input.error input').focus(function(){
       $(this).parent().removeClass('error'); 
       $(this).parent().find('.error-message').fadeTo(500,0).slideUp(); 
       $(this).unbind('focus'); 
    });
    
    /**
     * Hide notification when close button is pressed
    **/
   $('.notif .close').click(function(){
       $(this).parent().fadeTo(500,0).slideUp(); 
       return false; 
   });
    
     /**
     * Tabs 
     */
    var anchor = window.location.hash;  // On récup l'ancre dans l'url http://......#ancre
    $('.tabs').each(function(){
        var current = null;             // Permet de connaitre l'élément courant
        var id = $(this).attr('id');    // ID de ma barre d'onglet
        // Si on a une ancre
        if(anchor != '' && $(this).find('a[href="'+anchor+'"]').length > 0){
            current = anchor;
        // Si on a une valeur de cookie
        }else if($.cookie('tab'+id) && $(this).find('a[href="'+$.cookie('tab'+id)+'"]').length > 0){
            current = $.cookie('tab'+id);
        // Sinon current = premier lien
        }else{
            current = $(this).find('a:first').attr('href');
        }
        
        $(this).find('a[href="'+current+'"]').addClass('active');   // On ajoute la classe active sur le lien qui correspond
        $(current).siblings().hide();                               // On masque les éléments
        $(this).find('a').click(function(){
           var link = $(this).attr('href'); 
           // On a cliqué sur l'élément déja active
           if(link == current){
               return false;
           }else{
               // On ajoute la class active sur l'onglet courant et on la supprime des autres onglets
               $(this).addClass('active').siblings().removeClass('active'); 
               $(link).show().siblings().hide();    // On masque/affiche les div suivant les cas
               current = link;                      // On change la valeur de l'onglet courant
               $.cookie('tab'+id,current);          // On stocke l'onglet courant dans les cookie
           }
        });
    });
    
    /**
     * CheckAll, if the checkbox with checkall class is checked/unchecked all checkbox would be checked
     * */
    $('#content .checkall').change(function(){
        $(this).parents('table:first').find('input').attr('checked', $(this).is(':checked')); 
    });
    
    /** 
     * Sidebar menus
     * Slidetoggle for menu list
     * */
    var currentMenu = null; 
    $('#sidebar>ul>li').each(function(){
        if($(this).find('li').length == 0){
            $(this).addClass('nosubmenu');
        }
    })
    $('#sidebar>ul>li[class!="nosubmenu"]>a').each(function(){
        if(!$(this).parent().hasClass('current')){
            $(this).parent().find('ul:first').hide();
        }else{
            currentMenu = $(this); 
        }
        $(this).click(function(){
            $('#sidebar>ul>li.current').removeClass('current'); 
            if(currentMenu != null && currentMenu.text() != $(this).text()){
                currentMenu.parent().find('ul:first').slideUp(); 
            }
            if(currentMenu != null && currentMenu.text() == $(this).text()){
                currentMenu.parent().find('ul:first').slideUp(); 
                currentMenu = null;
            }else{
                currentMenu = $(this);
                currentMenu.parent().addClass('current'); 
                currentMenu.parent().find('ul:first').slideDown(); 
            }
            return false;
        }); 
    }); 
    
    /**
     * Fake Placeholder
     * User labels as placeholder for the next input
     * */
    $('.placeholder,#content.login .input').each(function(){
       var label = $(this).find('label:first');
	   var input = $(this).find('input:first,textarea:first'); 
       if(input.val() != ''){
           label.stop().hide(); 
       }
       input.focus(function(){
           if($(this).val() == ''){
                label.stop().fadeTo(500,0.5);  
           }
           $(this).parent().removeClass('error').find('.error-message').fadeOut(); 
       });
       input.blur(function(){
           if($(this).val() == ''){
                label.stop().fadeTo(500,1);  
           }
       });
       input.keypress(function(){
          label.stop().hide(); 
       });
       input.keyup(function(){
           if($(this).val() == ''){
                label.stop().fadeTo(500,0.5); 
           }
       });
	   input.bind('cut copy paste', function(e) {
			label.stop().hide(); 
	   });
    }); 
    
    $('.close').click(function(){$(this).parent().fadeTo(500,0).slideUp();});
    
    /** 
     * When window is resized
     * */
    $(window).resize(function(){
         /**
          * All "center" class block are centered
          * used for float left centering 
          * */
         $('.center').each(function(){
             $(this).css('display','inline'); 
             var width = $(this).width(); 
             if(parseInt($(this).height()) < 100){
                 $(this).css({width:'auto'}); 
             }else{
                 $(this).css({width:width}); 
             }
             $(this).css('display','block'); 
         }); 
         
         /**
          * Calendar sizing (all TD with same height
          * */
         $('.calendar td').height($('.calendar td[class!="padding"]').width());
    });
    
    $(window).trigger('resize'); 
    function scrollTo(cible){
            if($(cible).length>=1){
                    hauteur=$(cible).offset().top;
            }
            else{
                    hauteur=$("a[name="+cible.substr(1,cible.length-1)+"]").offset().top;
            }
            hauteur -= (windowH()-$(cible).height())/2;
            $('html,body').animate({scrollTop: hauteur}, 1000,'easeOutQuint');
            return false;
    }    
    function windowH(){
	if (window.innerHeight) return window.innerHeight  ;
	else{return $(window).height();}
}

});


/**
 * JQuery Easing for smooooooooth animation
 */
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});
