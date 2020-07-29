function EASE_enums() {
	enum EASE {
	InQuad,
	OutQuad,
	InOutQuad,
	InCubic,
	OutCubic,
	InOutCubic,
	InQuart,
	OutQuart,
	InOutQuart,
	InQuint,
	OutQuint,
	InOutQuint,
	InSine,
	OutSine,
	InOutSine,
	InExpo,
	OutExpo,
	InOutExpo,
	InCirc,
	OutCirc,
	InOutCirc,
	InElastic,
	OutElastic,
	InOutElastic,
	InBack,
	OutBack,
	InOutBack,
	InBounce,
	OutBounce,
	InOutBounce,
	Linear
	}
}

function ease_lerp(easing_type, from_val, to_val, lerp_at) {

	var type = easing_type;// constant value
	var b = from_val;// beginning value
	var c = to_val-b;// ending value
	var t = lerp_at;// current time
	var d = 1;// time duration
	var td = t/d;
	var td2 = t/(d/2);
	var ttd = t/d-1;
	var ret;
	switch (type) {
	    case 0:
	        return c*(td)*td + b;
	    break;
	    case 1:
	        return -c *(td)*(td-2) + b;
	    break;
	        case 2:
	        if ((td2) < 1) return c/2*td2*td2 + b;
	        return -c/2 * ((td2-1)*(td2-3) - 1) + b;
	    break;
	    case 3:
	        return c*(td)*td*td + b;
	    break;
	    case 4:
	        return c*((ttd)*ttd*ttd + 1) + b;
	    break;
	    case 5:
	        if ((td2) < 1) return c/2*td2*td2*td2 + b;
	        return c/2*((td2-2)*(td2-2)*(td2-2) + 2) + b;
	    break;
	    case 6:
	        return c*(td)*td*td*td + b;
	    break;
	    case 7:
	        return -c * ((ttd)*ttd*ttd*ttd - 1) + b;
	    break;
	    case 8:
	        if ((td2) < 1) return c/2*td2*td2*td2*td2 + b;
	        return -c/2 * ((td2-2)*(td2-2)*(td2-2)*(td2-2) - 2) + b;
	    break;
	    case 9:
	        return c*(td)*td*td*td*td + b;
	    break;
	    case 10:
	        return c*((ttd)*ttd*ttd*ttd*ttd + 1) + b;
	    break;
	    case 11:
	        if ((td2) < 1) return c/2*td2*td2*td2*td2*td2 + b;
	        return c/2*((td2-2)*(td2-2)*(td2-2)*(td2-2)*(td2-2) + 2) + b;
	    break;
	    case 12:
	        return -c * cos(td * (pi/2)) + c + b;
	    break;
	    case 13:
	        return c * sin(td * (pi/2)) + b;
	    break;
	    case 14:
	        return -c/2 * (cos(pi*t/d) - 1) + b;
	    break;
	    case 15:
	        if (t==0) return b;
	        else return (c * power(2, 10 * (t/d - 1)) + b);
	    break;
	    case 16:
	        if (t==d) return b+c;
	        else return c * (-power(2, -10 * td) + 1) + b;
	    break;
	    case 17:
	        if (t==0) return b;
	        if (t==d) return b+c;
	        if ((td2) < 1) return c/2 * power(2, 10 * (td2 - 1)) + b;
	        return c/2 * (-power(2, -10 * (td2-1)) + 2) + b;
	    break;
	    case 18:
	        return -c * (sqrt(1 - (td)*td) - 1) + b;
	    break;
	    case 19:
	        return c * sqrt(1 - (ttd)*ttd) + b;
	    break;
	    case 20:
	        if ((td2) < 1) return -c/2 * (sqrt(1 - td2*td2) - 1) + b;
	        return c/2 * (sqrt(1 - (td2-2)*(td2-2)) + 1) + b;
	    break;
	    case 21:
	        var s=1.70158; var p=0; var a=c;
	        if (t==0) return b;
	        if ((td)==1) return b+c;
	        if (!p) p=d*.3;
	        if (a < abs(c)) { a=c; var s=p/4; }
	        else var s = p/(2*pi) * arcsin (c/a);
	        return -(a*power(2, 10*(td-1)) * sin( ((td-1)*d-s)*(2*pi)/p )) + b;
	    break;
	    case 22:
	        var s=1.70158;var p=0;var a=c;
	        if (t==0) return b;
	        if ((td)==1) return b+c;
	        if (!p) p=d*.3;
	        if (a < abs(c)) { a=c; var s=p/4; }
	        else var s = p/(2*pi) * arcsin(c/a);
	        return a*power(2, -10*td) * sin( (td*d-s)*(2*pi)/p ) + c + b;
	    break;
	    case 23:
	        var s=1.70158;var p=0;var a=c;
	        if (t==0) return b;
	        if ((td2)==2) return b+c;
	        if (!p) p=d*(.3*1.5);
	        if (a < abs(c)) { a=c; var s=p/4; }
	        else var s = p/(2*pi) * arcsin(c/a);
	        if (td2 < 1) return -0.5*(a*power(2,10*(td2-1)) * sin( ((td2-1)*d-s)*(2*pi)/p )) + b;
	        return a*power(2,-10*(td2-1)) * sin( ((td2-1)*d-s)*(2*pi)/p )*0.5 + c + b;
	    break;
	    case 24:
	        var s = 1.70158;
	        return c*(td)*td*((s+1)*td - s) + b;
	    break;
	    case 25:
	        s = 1.70158;
	        return c*(ttd*ttd*((s+1)*ttd + s) + 1) + b;
	    break;
	    case 26:
	        s = 1.70158; 
	        if ((td2) < 1) return c/2*(td2*td2*(((s*(1.525))+1)*td2 - (s*(1.525)))) + b;
	        return c/2*((td2-2)*(td2-2)*(((s*(1.525))+1)*(td2-2) + (s*(1.525))) + 2) + b;
	    break;
	    case 27:
	        t = d-t;
	        if ((td) < (1/2.75)) {
	        var ret = c*(7.5625*td*td) + b;
	        } else if (td < (2/2.75)) {
	        var ret = c*(7.5625*(td-(1.5/2.75))*(td-(1.5/2.75)) + .75) + b;
	        } else if (td < (2.5/2.75)) {
	        var ret = c*(7.5625*(td-(2.25/2.75))*(td-(2.25/2.75)) + .9375) + b;
	        } else {
	        var ret = c*(7.5625*(td-(2.625/2.75))*(td-(2.625/2.75)) + .984375) + b;
	        }
	        return c - ret + b;
	    break;
	    case 28:
	        if ((td) < (1/2.75)) {
	        var ret = c*(7.5625*td*td) + b;
	        } else if (td < (2/2.75)) {
	        var ret = c*(7.5625*(td-(1.5/2.75))*(td-(1.5/2.75)) + .75) + b;
	        } else if (td < (2.5/2.75)) {
	        var ret = c*(7.5625*(td-(2.25/2.75))*(td-(2.25/2.75)) + .9375) + b;
	        } else {
	        var ret = c*(7.5625*(td-(2.625/2.75))*(td-(2.625/2.75)) + .984375) + b;
	        }
	        return ret;
	    break;
	    case 29:
	        if (t < d/2) {
	            t *= 2;
	            t = d-t;
	            td = t/d;
	            if ((td) < (1/2.75)) {
	            var ret = c*(7.5625*td*td) + b;
	            } else if (td < (2/2.75)) {
	            var ret = c*(7.5625*(td-(1.5/2.75))*(td-(1.5/2.75)) + .75) + b;
	            } else if (td < (2.5/2.75)) {
	            var ret = c*(7.5625*(td-(2.25/2.75))*(td-(2.25/2.75)) + .9375) + b;
	            } else {
	            var ret = c*(7.5625*(td-(2.625/2.75))*(td-(2.625/2.75)) + .984375) + b;
	            }
	            ret = c - ret + b;
	            return ret * .5 + b
	        }
	        else {
	            t = t*2-d;
	            td = t/d;
	            if ((td) < (1/2.75)) {
	            var ret = c*(7.5625*td*td) + b;
	            } else if (td < (2/2.75)) {
	            var ret = c*(7.5625*(td-(1.5/2.75))*(td-(1.5/2.75)) + .75) + b;
	            } else if (td < (2.5/2.75)) {
	            var ret = c*(7.5625*(td-(2.25/2.75))*(td-(2.25/2.75)) + .9375) + b;
	            } else {
	            var ret = c*(7.5625*(td-(2.625/2.75))*(td-(2.625/2.75)) + .984375) + b;
	            }
	            return ret * .5 + c*.5 + b;
	        }
	    break;
	    default:
	        return c *(td) + b;
	    break;
	}





}

function ease_progress(ease_type, from_val, to_val, end_at, at) {
	/*
	    like ease_lerp but I calculate the lerp at
    
	    using the easing_type, ease from from_val to to_val based on the value of at, which is from 0 to end_at
    
	    where end_at is to maximum value at will hit
    
	    when at is 0 from_val is returned. when at is end_at, to_val is returned
    
	    if at smaller or bigger than the expected range, the easing will be done and return a value beyond the from/to vals
	    which is a behaviour that is expected by some people. you have to clamp the values yourself
    
	    create:
	    at = 0;
	    end_at = 600; //end in 600 ticks
    
	    step:
	    at = clamp(at,0,100)
	    x = tmc_ease_progress(EASE.InQuad,0,1280,end_at,at);
	    y = tmc_ease_progress(EASE.InQuad,0,720,end_at,at);
	    at ++;
	*/
	return ease_lerp(ease_type,from_val,to_val,end_at/at);
}
	
function ease_start_end(ease_type, from_val, to_val, start_at, end_at, at) {
	
	return ease_progress(ease_type,from_val,to_val,start_at-end_at,at-start_at);
	/*
	    like ease_progress but I calculate the lerp at based on the start_at, end_at and at
    
	    using the easing_type, ease from from_val to to_val based on the value of at, which is from start_at to end_at
    
	    where end_at is to maximum value at will hit, and start_at is the minumum at will be
    
	    when at is start_at from_val is returned. when at is end_at, to_val is returned
    
	    if at smaller or bigger than the expected range, the easing will be done and return a value beyond the from/to vals
	    which is a behaviour that is expected by some people. you have to clamp the values yourself
    
	    this function is particularly usefull for time based lerping when you want to blindly count time and act only
	       when the time is inside a specific period
    
	    create:
	    start_t = get_timer() +2000000; //start 2 seconds from now
	    end_t = start_t + 2000000;      //end 2 seconds after start
    
	    step:
	    var time = clamp(get_timer(),start_t,end_t);
	    x = tmc_ease_start_end(EASE.InQuad,0,1280,100,start_t,end_t,time);
	    y = tmc_ease_start_end(EASE.InQuad,0,720,100,start_t,end_t,time);
    
    
	    or
	    create:
	    at = 0;
	    start_at = 400; //start moving when tick count is 400
	    end_at = 1200;  //end moving when tick count is 1200
    
	    step:
	    at = clamp(at,start_at,end_at)
	    x = tmc_ease_start_end(EASE.InQuad,0,1280,100,start_at,end_at,get_timer());
	    y = tmc_ease_start_end(EASE.InQuad,0,720,100,start_at,end_at,get_timer());
	    at ++;
	*/
}