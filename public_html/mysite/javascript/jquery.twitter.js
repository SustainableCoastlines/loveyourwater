/***
 * Twitter JS v1.13.1
 * http://code.google.com/p/twitterjs/
 * Copyright (c) 2009 Remy Sharp / MIT License
 * $Date: 2009-08-25 09:45:35 +0100 (Tue, 25 Aug 2009) $
 */
if(typeof renderTwitters!='function')(function(){
    var j=(function(){
        var b=navigator.userAgent.toLowerCase();
        return{
            webkit:/(webkit|khtml)/.test(b),
            opera:/opera/.test(b),
            msie:/msie/.test(b)&&!(/opera/).test(b),
            mozilla:/mozilla/.test(b)&&!(/(compatible|webkit)/).test(b)
            }
        })();
    var k=0;
    var n=[];
    var o=false;
    var p=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    window.ify=function(){
    var c={
        '"':'&quot;',
        '&':'&amp;',
        '<':'&lt;',
        '>':'&gt;'
    };

    return{
        "link":function(t){
            return t.replace(/[a-z]+:\/\/[a-z0-9-_]+\.[a-z0-9-_:~%&\?\/.=]+[^:\.,\)\s*$]/ig,function(m){
                return'<a href="'+m+'">'+((m.length>25)?m.substr(0,24)+'...':m)+'</a>'
                })
            },
        "at":function(t){
            return t.replace(/(^|[^\w]+)\@([a-zA-Z0-9_]{1,15})/g,function(m,a,b){
                return a+'@<a href="http://twitter.com/'+b+'">'+b+'</a>'
                })
            },
        "hash":function(t){
            return t.replace(/(^|[^\w'"]+)\#([a-zA-Z0-9_]+)/g,function(m,a,b){
                return a+'#<a href="http://search.twitter.com/search?q=%23'+b+'">'+b+'</a>'
                })
            },
        "clean":function(a){
            return this.hash(this.at(this.link(a)))
            }
        }
}();
    window.renderTwitters=function(a,b){
    function node(e){
        return document.createElement(e)
        }
        function text(t){
        return document.createTextNode(t)
        }
        var c=document.getElementById(b.twitterTarget);
    var d=null;
    var f=node('div'),div,jcon=node('div'),statusSpan,timeSpan,i,max=a.length>b.count?b.count:a.length;
    f.id="twitterslides";
    for(i=0;i<max&&a[i];i++){
        d=getTwitterData(a[i]);
        if(b.ignoreReplies&&a[i].text.substr(0,1)=='@'){
            max++;
            continue
        }
        div=node('div');
        if(b.template){
            div.innerHTML=b.template.replace(/%([a-z_\-\.]*)%/ig,function(m,l){
                var r=d[l]+""||"";
                if(l=='text'&&b.enableLinks)r=ify.clean(r);
                return r
                })
            }else{
            statusSpan=node('span');
            statusSpan.className='twitterStatus';
            timeSpan=node('span');
            timeSpan.className='twitterTime';
            statusSpan.innerHTML=a[i].text;
            if(b.enableLinks==true){
                statusSpan.innerHTML=ify.clean(statusSpan.innerHTML)
                }
                timeSpan.innerHTML=relative_time(a[i].created_at);
            if(b.prefix){
                var s=node('span');
                s.className='twitterPrefix';
                s.innerHTML=b.prefix.replace(/%(.*?)%/g,function(m,l){
                    return a[i].user[l]
                    });
                div.appendChild(s);
                div.appendChild(text(' '))
                }
                div.appendChild(statusSpan);
            div.appendChild(text(' '));
            div.appendChild(timeSpan)
            }
            if(b.newwindow){
            div.innerHTML=div.innerHTML.replace(/<a href/gi,'<a target="_blank" href')
            }
            c.appendChild(div)
        }
        //if(b.clearContents){
        //while(c.firstChild){
        //    c.removeChild(c.firstChild)
        //    }
       // }
    //c.appendChild(f);
    if(typeof b.callback=='function'){
    b.callback()
    }
};

window.getTwitters=function(e,f,g,h){
    k++;
    if(typeof f=='object'){
        h=f;
        f=h.id;
        g=h.count
        }
        if(!g)g=1;
    if(h){
        h.count=g
        }else{
        h={}
    }
    if(!h.timeout&&typeof h.onTimeout=='function'){
    h.timeout=10
    }
    if(typeof h.clearContents=='undefined'){
    h.clearContents=true
    }
    if(h.withFriends)h.withFriends=false;
h['twitterTarget']=e;
if(typeof h.enableLinks=='undefined')h.enableLinks=true;
window['twitterCallback'+k]=function(a){
    if(h.timeout){
        clearTimeout(window['twitterTimeout'+k])
        }
        renderTwitters(a,h)
    };

ready((function(c,d){
    return function(){
        if(!document.getElementById(c.twitterTarget)){
            return
        }
        var a='http://www.twitter.com/statuses/'+(c.withFriends?'friends_timeline':'user_timeline')+'/'+f+'.json?callback=twitterCallback'+d+'&count=20&cb='+Math.random();
        if(c.timeout){
            window['twitterTimeout'+d]=setTimeout(function(){
                if(c.onTimeoutCancel)window['twitterCallback'+d]=function(){};

                c.onTimeout.call(document.getElementById(c.twitterTarget))
                },c.timeout*1000)
            }
            var b=document.createElement('script');
        b.setAttribute('src',a);
        document.getElementsByTagName('head')[0].appendChild(b)
        }
    })(h,k))
};

DOMReady();
function getTwitterData(a){
    var b=a,i;
    for(i in a.user){
        b['user_'+i]=a.user[i]
        }
        b.time=relative_time(a.created_at);
    return b
    }
    function ready(a){
    if(!o){
        n.push(a)
        }else{
        a.call()
        }
    }
function fireReady(){
    o=true;
    var a;
    while(a=n.shift()){
        a.call()
        }
    }
function DOMReady(){
    if(document.addEventListener&&!j.webkit){
        document.addEventListener("DOMContentLoaded",fireReady,false)
        }else if(j.msie){
        document.write("<scr"+"ipt id=__ie_init defer=true src=//:><\/script>");
        var a=document.getElementById("__ie_init");
        if(a){
            a.onreadystatechange=function(){
                if(this.readyState!="complete")return;
                this.parentNode.removeChild(this);
                fireReady.call()
                }
            }
        a=null
    }else if(j.webkit){
    var b=setInterval(function(){
        if(document.readyState=="loaded"||document.readyState=="complete"){
            clearInterval(b);
            b=null;
            fireReady.call()
            }
        },10)
}
}
function relative_time(c){
    var d=c.split(" "),parsed_date=Date.parse(d[1]+" "+d[2]+", "+d[5]+" "+d[3]),date=new Date(parsed_date),relative_to=(arguments.length>1)?arguments[1]:new Date(),delta=parseInt((relative_to.getTime()-parsed_date)/1000),r='';
    function formatTime(a){
        var b=a.getHours(),min=a.getMinutes()+"",ampm='AM';
        if(b==0){
            b=12
            }else if(b==12){
            ampm='PM'
            }else if(b>12){
            b-=12;
            ampm='PM'
            }
            if(min.length==1){
            min='0'+min
            }
            return b+':'+min+' '+ampm
        }
        function formatDate(a){
        var b=a.toDateString().split(/ /),mon=p[a.getMonth()],day=a.getDate()+'',dayi=parseInt(day),year=a.getFullYear(),thisyear=(new Date()).getFullYear(),th='th';
        if((dayi%10)==1&&day.substr(0,1)!='1'){
            th='st'
            }else if((dayi%10)==2&&day.substr(0,1)!='1'){
            th='nd'
            }else if((dayi%10)==3&&day.substr(0,1)!='1'){
            th='rd'
            }
            if(day.substr(0,1)=='0'){
            day=day.substr(1)
            }
            return mon+' '+day+th+(thisyear!=year?', '+year:'')
        }
        delta=delta+(relative_to.getTimezoneOffset()*60);
    if(delta<5){
        r='less than 5 seconds ago'
        }else if(delta<30){
        r='half a minute ago'
        }else if(delta<60){
        r='less than a minute ago'
        }else if(delta<120){
        r='1 minute ago'
        }else if(delta<(45*60)){
        r=(parseInt(delta/60)).toString()+' minutes ago'
        }else if(delta<(2*90*60)){
        r='about 1 hour ago'
        }else if(delta<(24*60*60)){
        r='about '+(parseInt(delta/3600)).toString()+' hours ago'
        }else{
        if(delta<(48*60*60)){
            r=formatTime(date)+' yesterday'
            }else{
            r=formatTime(date)+' '+formatDate(date)
            }
        }
    return r
}
})();