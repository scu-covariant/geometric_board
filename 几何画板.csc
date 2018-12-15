#变量定义
var pi=3.14159265358979
var func="mouse"
var point_list=new array
var line_list=new array
var circle_list=new array
var length_list=new array
var angle_list=new array
var window_opened=true
var count=0
var jilu=-1
var ls=false
var l1=-1
var l2=-1
var c1=-1
var c2=-1
var x1=new number
var y1=new number
var x2=new number
var y2=new number
var x3=new number
var y3=new number
var p1=new number
var p2=new number
var p3=new number
#类型
struct point
    var point_x=new number
    var point_y=new number
    var move_able=new boolean
    var look_able=true
    var use_able=true
    var on_line=-1
    var on_circle=-1
end
struct mid_point
    var point_x=new number
    var point_y=new number
    var move_able=false
    var look_able=true
    var use_able=true
    var p1=new number
    var p2=new number
end
struct crossover_point
    var cross_type=new string
    var func1=new number
    var func2=new number
    var point_x=new number
    var point_y=new number
    var move_able=false
    var look_able=true
    var use_able=true
end
struct line
    var p1=new number
    var p2=new number
    var look_able=true
    var use_able=true
end
struct parallel_line
    var l1=new number
    var p1=new number
    var p2=new number
    var look_able=true
    var use_able=true
end
struct vertical_line
    var l1=new number
    var p1=new number
    var p2=new number
    var look_able=true
    var use_able=true
end
struct two_circle_line
    var c1=new number
    var c2=new number
    var p1=new number
    var p2=new number
    var look_able=false
    var use_able=true
end
struct circle
    var p1=new number
    var p2=new number
    var look_able=true
    var use_able=true
end
struct length
    var p1=new number
    var p2=new number
end
struct angle
    var p1=new number
    var p2=new number
    var p3=new number
end
#重置
function reset()
    count=0
    ls=false
    l1=-1
    l2=-1
    c1=-1
    c2=-1
    x1=-1
    y1=-1
    x2=-1
    y2=-1
    x3=-1
    y3=-1
    p1=-1
    p2=-1
    jilu=-1
end
#三点
function three_p(pos_x,pos_y)
    if(count==0)
        if(point_list.empty()&&line_list.empty()&&circle_list.empty())
            var p=new point
            p.point_x=pos_x
            p.point_y=pos_y
            p.move_able=true
            point_list.push_back(p)
            p1=point_list.size()-1
            x1=pos_x
            y1=pos_y
            count=3
        else
        var a=true
            for i=0,i<=point_list.size()-1,i++
                if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).look_able&&point_list.at(i).use_able)
                    x1=point_list.at(i).point_x
                    y1=point_list.at(i).point_y
                    p1=i
                    a=false
                    count=3
                    break
                end
            end
        if(a)
            for i=0,i<=line_list.size()-1,i++
                if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_line=i
                    if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                        p.point_x=point_list.at(line_list.at(i).p1).point_x
                        p.point_y=pos_y
                    else
                        p.point_x=pos_x
                        if(point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)
                            p.point_y=point_list.at(line_list.at(i).p1).point_y
                        else
                            p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                        end
                    end
                    x1=p.point_x
                    y1=p.point_y
                    point_list.push_back(p)
                    p1=point_list.size()-1
                    a=false
                    count=3
                    break
                end
            end
        end
        if(a)
            for i=0,i<=circle_list.size()-1,i++
                var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                if(math.abs(d)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_circle=i
                    if(d>=0)
                        if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                            p.point_x=pos_x-d
                        else
                            p.point_x=pos_x+d
                        end
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    else
                        p.point_x=pos_x
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    end
                    x1=p.point_x
                    y1=p.point_y
                    count=3
                    point_list.push_back(p)
                    var line1=new line
                    line1.p1=line_list.at(p.on_line).p1
                    line1.p2=point_list.size()-1
                    line_list.push_back(line1)
                    p1=point_list.size()-1
                    break
                end
            end
        end
            if(count==0)
                x1=pos_x
                y1=pos_y
                var p=new point
                p.point_x=pos_x
                p.point_y=pos_y
                p.move_able=true
                point_list.push_back(p)
                p1=point_list.size()-1
                count=3
            end
        end
        return false
    end
    if(count==1)
        var a=true
        for i=0,i<=point_list.size()-1,i++
           if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).look_able&&point_list.at(i).use_able)
                x2=point_list.at(i).point_x
                y2=point_list.at(i).point_y
                p2=i
                a=false
                count=2
                break
            end
        end
        if(a)
            for i=0,i<=line_list.size()-1,i++
                if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_line=i
                    if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                        p.point_x=point_list.at(line_list.at(i).p1).point_x
                        p.point_y=pos_y
                    else
                        p.point_x=pos_x
                        if(point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)
                            p.point_y=point_list.at(line_list.at(i).p1).point_y
                        else
                            p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                        end
                    end
                    x2=p.point_x
                    y2=p.point_y
                    point_list.push_back(p)
                    var line1=new line
                    line1.p1=line_list.at(p.on_line).p1
                    line1.p2=point_list.size()-1
                    line_list.push_back(line1)
                    p2=point_list.size()-1
                    a=false
                    count=2
                    break
                end
            end
        end
        if(a)
            for i=0,i<=circle_list.size()-1,i++
                var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                if(math.abs(d)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_circle=i
                    if(d>=0)
                        if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                            p.point_x=pos_x-d
                        else
                            p.point_x=pos_x+d
                        end
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    else
                        p.point_x=pos_x
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    end
                    x2=p.point_x
                    y2=p.point_y
                    count=2
                    point_list.push_back(p)
                    p2=point_list.size()-1
                    break
                end
            end
        end
        if(count==1)
            var p=new point
            p.point_x=pos_x
            p.point_y=pos_y
            p.move_able=true
            point_list.push_back(p)
            p2=point_list.size()-1
            x2=pos_x
            y2=pos_y
            count=2
        end
        return false
    end
    if(count==2)
        var a=true
        for i=0,i<=point_list.size()-1,i++
            if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).look_able&&point_list.at(i).use_able)
                x3=point_list.at(i).point_x
                y3=point_list.at(i).point_y
                p3=i
                a=false
                count=0
                break
            end
        end
        if(a)
            for i=0,i<=line_list.size()-1,i++
                if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_line=i
                    if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                        p.point_x=point_list.at(line_list.at(i).p1).point_x
                        p.point_y=pos_y
                    else
                        p.point_x=pos_x
                        if(point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)
                            p.point_y=point_list.at(line_list.at(i).p1).point_y
                        else
                            p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                        end
                    end
                    x3=p.point_x
                    y3=p.point_y
                    point_list.push_back(p)
                    var line1=new line
                    line1.p1=line_list.at(p.on_line).p1
                    line1.p2=point_list.size()-1
                    line_list.push_back(line1)
                    p3=point_list.size()-1
                    a=false
                    count=0
                    break
                end
            end
        end
        if(a)
            for i=0,i<=circle_list.size()-1,i++
                var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                if(math.abs(d)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_circle=i
                    if(d>=0)
                        if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                            p.point_x=pos_x-d
                        else
                            p.point_x=pos_x+d
                        end
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    else
                        p.point_x=pos_x
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    end
                    x3=p.point_x
                    y3=p.point_y
                    count=0
                    point_list.push_back(p)
                    p3=point_list.size()-1
                    break
                end
            end
        end
        if(count==2)
            var p=new point
            p.point_x=pos_x
            p.point_y=pos_y
            p.move_able=true
            point_list.push_back(p)
            p3=point_list.size()-1
            x3=pos_x
            y3=pos_y
            count=0
        end
        return true
    end
end
#两点
function two_p(pos_x,pos_y)
    if(count==0)
        if(point_list.empty()&&line_list.empty()&&circle_list.empty())
            var p=new point
            p.point_x=pos_x
            p.point_y=pos_y
            p.move_able=true
            point_list.push_back(p)
            p1=point_list.size()-1
            x1=pos_x
            y1=pos_y
            count=2
        else
        var a=true
            for i=0,i<=point_list.size()-1,i++
                if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).look_able&&point_list.at(i).use_able)
                    x1=point_list.at(i).point_x
                    y1=point_list.at(i).point_y
                    p1=i
                    a=false
                    count=2
                    break
                end
            end
        if(a)
            for i=0,i<=line_list.size()-1,i++
                if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_line=i
                    if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                        p.point_x=point_list.at(line_list.at(i).p1).point_x
                        p.point_y=pos_y
                    else
                        p.point_x=pos_x
                        if((point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)&&line_list.at(i).look_able&&line_list.at(i).use_able)
                            p.point_y=point_list.at(line_list.at(i).p1).point_y
                        else
                            p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                        end
                    end
                    x1=p.point_x
                    y1=p.point_y
                    point_list.push_back(p)
                    p1=point_list.size()-1
                    var line1=new line
                    line1.p1=line_list.at(p.on_line).p1
                    line1.p2=point_list.size()-1
                    line_list.push_back(line1)
                    a=false
                    count=2
                    break
                end
            end
        end
        if(a)
            for i=0,i<=circle_list.size()-1,i++
                var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                if(math.abs(d)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_circle=i
                    if(d>=0)
                        if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                            p.point_x=pos_x-d
                        else
                            p.point_x=pos_x+d
                        end
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    else
                        p.point_x=pos_x
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    end
                    x1=p.point_x
                    y1=p.point_y
                    count=2
                    point_list.push_back(p)
                    p1=point_list.size()-1
                    break
                end
            end
        end
            if(count==0)
                x1=pos_x
                y1=pos_y
                var p=new point
                p.point_x=pos_x
                p.point_y=pos_y
                p.move_able=true
                point_list.push_back(p)
                p1=point_list.size()-1
                count=2
            end
        end
        return false
    end
    if(count==1)
        var a=true
        for i=0,i<=point_list.size()-1,i++
           if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).look_able&&point_list.at(i).use_able)
                x2=point_list.at(i).point_x
                y2=point_list.at(i).point_y
                p2=i
                a=false
                count=0
                break
            end
        end
        if(a)
            for i=0,i<=line_list.size()-1,i++
                if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_line=i
                    if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                        p.point_x=point_list.at(line_list.at(i).p1).point_x
                        p.point_y=pos_y
                    else
                        p.point_x=pos_x
                        if(point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)
                            p.point_y=point_list.at(line_list.at(i).p1).point_y
                        else
                            p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                        end
                    end
                    x2=p.point_x
                    y2=p.point_y
                    point_list.push_back(p)
                    var line1=new line
                    line1.p1=line_list.at(p.on_line).p1
                    line1.p2=point_list.size()-1
                    line_list.push_back(line1)
                    p2=point_list.size()-1
                    a=false
                    count=0
                    break
                end
            end
        end
        if(a)
            for i=0,i<=circle_list.size()-1,i++
                var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                if(math.abs(d)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_circle=i
                    if(d>=0)
                        if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                            p.point_x=pos_x-d
                        else
                            p.point_x=pos_x+d
                        end
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    else
                        p.point_x=pos_x
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    end
                    x2=p.point_x
                    y2=p.point_y
                    count=0
                    point_list.push_back(p)
                    p2=point_list.size()-1
                    break
                end
            end
        end
        if(count==1)
            var p=new point
            p.point_x=pos_x
            p.point_y=pos_y
            p.move_able=true
            point_list.push_back(p)
            p2=point_list.size()-1
            x2=pos_x
            y2=pos_y
            count=0
        end
        return true
    end
end
#线点
function line_point(pos_x,pos_y)
    var a=true
    if(count==0)
        if(line_list.empty())
            return 0
        end
        for i=0,i<=line_list.size()-1,i++
            if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                l1=i
                count=2
                return 1
            end
        end
        return 0
    end
    if(count==1)
        for i=0,i<=point_list.size()-1,i++
           if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).look_able)
                x1=point_list.at(i).point_x
                y1=point_list.at(i).point_y
                p1=i
                a=false
                count=0
                break
            end
        end
        if(a)
            for i=0,i<=line_list.size()-1,i++
                if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_line=i
                    if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                        p.point_x=point_list.at(line_list.at(i).p1).point_x
                        p.point_y=pos_y
                    else
                        p.point_x=pos_x
                        if(point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)
                            p.point_y=point_list.at(line_list.at(i).p1).point_y
                        else
                            p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                        end
                    end
                    point_list.push_back(p)
                    p1=point_list.size()-1
                    var line1=new line
                    line1.p1=line_list.at(p.on_line).p1
                    line1.p2=point_list.size()-1
                    line_list.push_back(line1)
                    a=false
                    count=0
                    break
                end
            end
        end
        if(a)
            for i=0,i<=circle_list.size()-1,i++
                var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                if(math.abs(d)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                    var p=new point
                    p.move_able=true
                    p.on_circle=i
                    if(d>=0)
                        if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                            p.point_x=pos_x-d
                        else
                            p.point_x=pos_x+d
                        end
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    else
                        p.point_x=pos_x
                        if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        else
                            p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                        end
                    end
                    count=0
                    x1=p.point_x
                    y1=p.point_y
                    point_list.push_back(p)
                    p1=point_list.size()-1
                    break
                end
            end
        end
        if(count==1)
            var p=new point
            p.point_x=pos_x
            p.point_y=pos_y
            p.move_able=true
            point_list.push_back(p)
            p1=point_list.size()-1
            x1=pos_x
            y1=pos_y
            count=0
        end
        return 2
    end
end
#交点判定
function cross(pos_x,pos_y)
    if(count==0)
        if(line_list.empty()&&circle_list.empty())
            return 0
        end
        for i=0,i<=line_list.size()-1,i++
            if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                l1=i
                count=2
                return 1
            end
        end
        for i=0,i<=circle_list.size()-1,i++
            if(math.abs(((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                c1=i
                count=2
                return 1
            end
        end
        return 0
    end
    if(count==1)
        for i=0,i<=line_list.size()-1,i++
            if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2&&line_list.at(i).look_able&&line_list.at(i).use_able)
                l2=i
                count=0
                return 2
            end
        end
        for i=0,i<=circle_list.size()-1,i++
            if(math.abs(((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5)<=2&&circle_list.at(i).look_able&&circle_list.at(i).use_able)
                c2=i
                count=0
                return 2
            end
        end
        return 0
    end
end
#界面
import imgui
using imgui
var win=window_application(700,420,"Geometry")
style_color_light()
while(!win.is_closed())
    win.prepare()
    begin_window("##MAIN_WINDOW",window_opened,{flags.no_collapse,flags.no_move,flags.no_title_bar})
    set_window_pos(vec2(0,20))
    set_window_size(vec2(win.get_window_width(),win.get_window_height()-20))
    if(begin_main_menu_bar())
        if(begin_menu("Geometry",true))
            if(begin_menu("Point",true))
                if(menu_item("point","",true))
                    reset()
                    func="point"
                end
                if(menu_item("crossover point","",true))
                    reset()
                    func="crossover point"
                end
                if(menu_item("mid point","",true))
                    reset()
                    func="mid point"
                end
                end_menu()
            end
            if(begin_menu("Line",true))
                if(menu_item("line","",true))
                    reset()
                    func="line"
                end
                if(menu_item("parallel line","",true))
                    reset()
                    func="parallel line"
                end
                 if(menu_item("vertical line","",true))
                    reset()
                    func="vertical line"
                end
                end_menu()
            end
            if(begin_menu("Circle",true))
                if(menu_item("two point","",true))
                    reset()
                    func="two point"
                end
                end_menu()
            end
            if(menu_item("Angle","",true))
                reset()
                func="angle"
            end
            if(menu_item("Length","",true))
                reset()
                func="length"
            end
            end_menu()
        end
        if(menu_item("Mouse","",true))
            reset()
            func="mouse"
        end
        if(menu_item("Move","",true))
            reset()
            func="move"
        end
        if(menu_item("Clear","",true))
            reset()
            func="mouse"
            point_list={}
            circle_list={}
            line_list={}
            length_list={}
            angle_list={}
        end
        if(begin_menu("Help",true))
            menu_item("Designed by:ZheShi","",false)
            if(begin_menu("How to use",true))
                menu_item("Use your mouse","",false)
                menu_item("Choose two points to draw the mid point","",false)
                menu_item("Choose two lines or two circles or a line and a circle to draw the crossover point","",false)
                menu_item("Choose two points to draw a line","",false)
                menu_item("Choose a line and a point to draw a vertical line or a parallel line","",false)
                menu_item("Choose a point as centre and another point which is on the circle to draw a circle","",false)
                menu_item("Choose three points(p1,p2,p3) to know the angle(p1,p2,p3)(deg)","",false)
                menu_item("Choose two points to know the distance","",false)
                end_menu()
            end
            end_menu()
        end
        end_main_menu_bar()
    end
    #菜单栏高20
    switch(func)
        case "mid point"
            if(ls)
                add_circle_filled(vec2((x1+get_mouse_pos_x())/2,(y1+get_mouse_pos_y())/2),5,vec4(0,0,0,1),30)
            end
        end
        case "two point"
            if(ls)
                add_circle(vec2(x1,y1),((get_mouse_pos_x()-x1)^2+(get_mouse_pos_y()-y1)^2)^0.5,vec4(0,0,0,1),100,3)
            end
        end
        case "line"
            if(ls)
                add_line(vec2(x1,y1),vec2(get_mouse_pos_x(),get_mouse_pos_y()),vec4(0,0,0,1),3)
            end
        end
        case "parallel line"
            if(ls)
                add_line(vec2(get_mouse_pos_x()-point_list.at(line_list.at(l1).p1).point_x+point_list.at(line_list.at(l1).p2).point_x,get_mouse_pos_y()-point_list.at(line_list.at(l1).p1).point_y+point_list.at(line_list.at(l1).p2).point_y),vec2(get_mouse_pos_x(),get_mouse_pos_y()),vec4(0,0,0,1),3)
            end
        end
        case "vertical line"
            if(ls)
                add_line(vec2(get_mouse_pos_x()+point_list.at(line_list.at(l1).p1).point_y-point_list.at(line_list.at(l1).p2).point_y,get_mouse_pos_y()-point_list.at(line_list.at(l1).p1).point_x+point_list.at(line_list.at(l1).p2).point_x),vec2(get_mouse_pos_x(),get_mouse_pos_y()),vec4(0,0,0,1),3)
            end
        end
        case "angle"
            if(ls)
                text(to_string((math.acos(((get_mouse_pos_x()-x2)*(x1-x2)+(get_mouse_pos_y()-y2)*(y1-y2))/(((get_mouse_pos_x()-x2)^2+(get_mouse_pos_y()-y2)^2)*((x1-x2)^2+(y1-y2)^2))^0.5))/pi*180)+"d")
            end
        end
        case "length"
            if(ls)
                text(to_string(((get_mouse_pos_x()-x1)^2+(get_mouse_pos_y()-y1)^2)^0.5/10))
            end
        end
    end
    if(is_mouse_clicked(0))
        var pos_x=get_mouse_pos_x()
        var pos_y=get_mouse_pos_y()
        if(pos_y>=20)
            switch func
                case "point"
                    var a=true
                    if(!point_list.empty())
                        for i=0,i<=point_list.size()-1,i++
                            if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25)
                                a=false
                                break
                            end
                        end
                    end
                    if(a&&!line_list.empty())
                        for i=0,i<=line_list.size()-1,i++
                            if(math.abs(((pos_x-point_list.at(line_list.at(i).p1).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)-(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(pos_y-point_list.at(line_list.at(i).p1).point_y))/((point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)^2+(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)^2)^0.5)<=2)
                                var p=new point
                                p.move_able=true
                                p.on_line=i
                                if(point_list.at(line_list.at(i).p1).point_x==point_list.at(line_list.at(i).p2).point_x)
                                    p.point_x=point_list.at(line_list.at(i).p1).point_x
                                    p.point_y=pos_y
                                else
                                    p.point_x=pos_x
                                    if(point_list.at(line_list.at(i).p1).point_y==point_list.at(line_list.at(i).p2).point_y)
                                        p.point_y=point_list.at(line_list.at(i).p1).point_y
                                    else
                                        p.point_y=(p.point_x-point_list.at(line_list.at(i).p1).point_x)/(point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(i).p2).point_x)*(point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(i).p2).point_y)+point_list.at(line_list.at(i).p1).point_y
                                    end
                                end
                                point_list.push_back(p)
                                var line1=new line
                                line1.p1=line_list.at(p.on_line).p1
                                line1.p2=point_list.size()-1
                                line_list.push_back(line1)
                                a=false
                                break
                            end
                        end
                    end
                    if(a&&!circle_list.empty())
                        for i=0,i<=circle_list.size()-1,i++
                            var d=((pos_x-point_list.at(circle_list.at(i).p1).point_x)^2+(pos_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5-((point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2+(point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2)^0.5
                            if(math.abs(d)<=2)
                                var p=new point
                                p.move_able=true
                                p.on_circle=i
                                if(d>=0)
                                    if(pos_x>=point_list.at(circle_list.at(i).p1).point_x)
                                        p.point_x=pos_x-d
                                    else
                                        p.point_x=pos_x+d
                                    end
                                    if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                                        p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                                    else
                                        p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                                    end
                                else
                                    p.point_x=pos_x
                                    if(pos_y>=point_list.at(circle_list.at(i).p1).point_y)
                                        p.point_y=point_list.at(circle_list.at(i).p1).point_y+((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                                    else
                                        p.point_y=point_list.at(circle_list.at(i).p1).point_y-((point_list.at(circle_list.at(i).p1).point_x-point_list.at(circle_list.at(i).p2).point_x)^2+(point_list.at(circle_list.at(i).p1).point_y-point_list.at(circle_list.at(i).p2).point_y)^2-(p.point_x-point_list.at(circle_list.at(i).p1).point_x)^2)^0.5
                                    end
                                end
                                a=false
                                point_list.push_back(p)
                                break
                            end
                        end
                    end
                    if(a)
                        var p=new point
                        p.point_x=pos_x
                        p.point_y=pos_y
                        p.move_able=true
                        point_list.push_back(p)
                    end
                end
                case "mid point"
                    var a=two_p(pos_x,pos_y)
                    if(count==2)
                        count=1
                        ls=true
                        end_window()
                        win.render()
                        continue
                    end
                    if(a)
                        ls=false
                        var p=new mid_point
                        p.p1=p1
                        p.p2=p2
                        point_list.push_back(p)
                    end
                end
                case "crossover point"
                    var a=cross(pos_x,pos_y)
                    if(a==0)
                        end_window()
                        win.render()
                        continue
                    end
                    if(count==2)
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(a==2)
                        if(c1!=-1)
                            if(c2!=-1)
                                var r1=((point_list.at(circle_list.at(c1).p2).point_x-point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c1).p2).point_y-point_list.at(circle_list.at(c1).p1).point_y)^2)^0.5
                                var r2=((point_list.at(circle_list.at(c2).p2).point_x-point_list.at(circle_list.at(c2).p1).point_x)^2+(point_list.at(circle_list.at(c2).p2).point_y-point_list.at(circle_list.at(c2).p1).point_y)^2)^0.5
                                var distance=((point_list.at(circle_list.at(c1).p1).point_x-point_list.at(circle_list.at(c2).p1).point_x)^2+(point_list.at(circle_list.at(c1).p1).point_y-point_list.at(circle_list.at(c2).p1).point_y)^2)^0.5
                                if(r1+r2>=distance&&math.abs(r1-r2)<=distance)
                                    if(point_list.at(circle_list.at(c1).p1).point_x==point_list.at(circle_list.at(c2).p1).point_x&&point_list.at(circle_list.at(c1).p1).point_y!=point_list.at(circle_list.at(c2).p1).point_y)
                                        var lsp1=new point
                                        lsp1.point_y=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y)^2-(point_list.at(circle_list.at(c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(c2).p1).point_y-point_list.at(circle_list.at(c1).p1).point_y)
                                        lsp1.point_x=10
                                        lsp1.look_able=false
                                        lsp1.move_able=false
                                        point_list.push_back(lsp1)
                                        var line1=new two_circle_line
                                        line1.p1=point_list.size()-1
                                        line1.c1=c1
                                        line1.c2=c2
                                        var lsp2=new point
                                        lsp2.point_y=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y)^2-(point_list.at(circle_list.at(c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(c2).p1).point_y-point_list.at(circle_list.at(c1).p1).point_y)
                                        lsp2.point_x=20
                                        lsp2.look_able=false
                                        lsp2.move_able=false
                                        point_list.push_back(lsp2)
                                        line1.p2=point_list.size()-1
                                        line_list.push_back(line1)
                                        l1=line_list.size()-1
                                        c1=-1
                                    end
                                    if(point_list.at(circle_list.at(c1).p1).point_x!=point_list.at(circle_list.at(c2).p1).point_x&&point_list.at(circle_list.at(c1).p1).point_y==point_list.at(circle_list.at(c2).p1).point_y)
                                        var lsp1=new point
                                        lsp1.point_x=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y)^2-(point_list.at(circle_list.at(c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(c2).p1).point_x-point_list.at(circle_list.at(c1).p1).point_x)
                                        lsp1.point_y=30
                                        lsp1.look_able=false
                                        lsp1.move_able=false
                                        point_list.push_back(lsp1)
                                        var line1=new two_circle_line
                                        line1.c1=c1
                                        line1.c2=c2
                                        line1.p1=point_list.size()-1
                                        var lsp2=new point
                                        lsp2.point_x=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y)^2-(point_list.at(circle_list.at(c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(c2).p1).point_x-point_list.at(circle_list.at(c1).p1).point_x)
                                        lsp2.point_y=50
                                        lsp2.look_able=false
                                        lsp2.move_able=false
                                        point_list.push_back(lsp2)
                                        line1.p2=point_list.size()-1
                                        line_list.push_back(line1)
                                        l1=line_list.size()-1
                                        c1=-1
                                    end
                                    if(point_list.at(circle_list.at(c1).p1).point_x!=point_list.at(circle_list.at(c2).p1).point_x&&point_list.at(circle_list.at(c1).p1).point_y!=point_list.at(circle_list.at(c2).p1).point_y)
                                        var line1=new two_circle_line
                                        line1.c1=c1
                                        line1.c2=c2
                                        var lsp1=new point
                                        lsp1.point_x=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y)^2-(point_list.at(circle_list.at(c1).p1).point_y)^2-40*(point_list.at(circle_list.at(c2).p1).point_y-point_list.at(circle_list.at(c1).p1).point_y))/(2*(point_list.at(circle_list.at(c2).p1).point_x-point_list.at(circle_list.at(c1).p1).point_x))
                                        lsp1.point_y=20
                                        lsp1.look_able=false
                                        lsp1.move_able=false
                                        point_list.push_back(lsp1)
                                        line1.p1=point_list.size()-1
                                        var lsp2=new point
                                        lsp2.point_y=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(c1).p1).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y)^2-(point_list.at(circle_list.at(c1).p1).point_y)^2)/(2*(point_list.at(circle_list.at(c2).p1).point_y-point_list.at(circle_list.at(c1).p1).point_y))
                                        lsp2.point_x=0
                                        lsp2.look_able=false
                                        lsp2.move_able=false
                                        point_list.push_back(lsp2)
                                        line1.p2=point_list.size()-1
                                        line_list.push_back(line1)
                                        l1=line_list.size()-1
                                        c1=-1
                                    end
                                else
                                    c1=-1
                                    c2=-1
                                end
                            end
                            if(l2!=-1)
                                l1=l2
                                l2=-1
                                c2=c1
                                c1=-1
                            end
                        end
                        if(l1!=-1)
                            if(l2!=-1)
                                var d=(point_list.at(line_list.at(l1).p1).point_x-point_list.at(line_list.at(l1).p2).point_x)*(point_list.at(line_list.at(l2).p1).point_y-point_list.at(line_list.at(l2).p2).point_y)-(point_list.at(line_list.at(l1).p1).point_y-point_list.at(line_list.at(l1).p2).point_y)*(point_list.at(line_list.at(l2).p1).point_x-point_list.at(line_list.at(l2).p2).point_x)
                                if(d!=0)
                                    var p=new crossover_point
                                    p.cross_type="ll"
                                    p.func1=l1
                                    p.func2=l2
                                    point_list.push_back(p)
                                    var line1=new line
                                    line1.p1=line_list.at(l1).p1
                                    line1.p2=point_list.size()-1
                                    line_list.push_back(line1)
                                    var line2=new line
                                    line2.p1=line_list.at(l2).p1
                                    line2.p2=point_list.size()-1
                                    line_list.push_back(line2)
                                    reset()
                                end
                            end
                            if(c2!=-1)
                                var r2=(point_list.at(circle_list.at(c2).p1).point_x-point_list.at(circle_list.at(c2).p2).point_x)^2+(point_list.at(circle_list.at(c2).p1).point_y-point_list.at(circle_list.at(c2).p2).point_y)^2
                                if(math.abs(((point_list.at(circle_list.at(c2).p1).point_x-point_list.at(line_list.at(l1).p1).point_x)*(point_list.at(line_list.at(l1).p1).point_y-point_list.at(line_list.at(l1).p2).point_y)-(point_list.at(line_list.at(l1).p1).point_x-point_list.at(line_list.at(l1).p2).point_x)*(point_list.at(circle_list.at(c2).p1).point_y-point_list.at(line_list.at(l1).p1).point_y))/((point_list.at(line_list.at(l1).p1).point_y-point_list.at(line_list.at(l1).p2).point_y)^2+(point_list.at(line_list.at(l1).p1).point_x-point_list.at(line_list.at(l1).p2).point_x)^2)^0.5)<=r2^0.5)
                                    if(point_list.at(line_list.at(l1).p1).point_x!=point_list.at(line_list.at(l1).p2).point_x)
                                        var cross_p1=new crossover_point
                                        cross_p1.cross_type="lc"
                                        cross_p1.func1=l1
                                        cross_p1.func2=c2
                                        point_list.push_back(cross_p1)
                                        if(typeid(line_list.at(l1))!=typeid(new two_circle_line))
                                            var line1=new line
                                            line1.p1=line_list.at(l1).p1
                                            line1.p2=point_list.size()-1
                                            line_list.push_back(line1)
                                        end
                                        var cross_p2=new crossover_point
                                        cross_p2.cross_type="lc"
                                        cross_p2.func1=l1
                                        cross_p2.func2=c2
                                        point_list.push_back(cross_p2)
                                        if(typeid(line_list.at(l1))!=typeid(new two_circle_line))
                                            var line2=new line
                                            line2.p1=line_list.at(l1).p1
                                            line2.p2=point_list.size()-1
                                            line_list.push_back(line2)
                                        end
                                    else
                                        var cross_p1=new crossover_point
                                        cross_p1.cross_type="lc"
                                        cross_p1.func1=l1
                                        cross_p1.func2=c2
                                        point_list.push_back(cross_p1)
                                        if(typeid(line_list.at(l1))!=typeid(new two_circle_line))
                                            var line1=new line
                                            line1.p1=line_list.at(l1).p1
                                            line1.p2=point_list.size()-1
                                            line_list.push_back(line1)
                                        end
                                        var cross_p2=new crossover_point
                                        cross_p2.cross_type="lc"
                                        cross_p2.func1=l1
                                        cross_p2.func2=c2
                                        point_list.push_back(cross_p2)
                                        if(typeid(line_list.at(l1))!=typeid(new two_circle_line))
                                            var line2=new line
                                            line2.p1=line_list.at(l1).p1
                                            line2.p2=point_list.size()-1
                                            line_list.push_back(line2)
                                        end
                                    end
                                else
                                    l1=-1
                                    c2=-1
                                end
                            end
                            reset()
                        end
                    end
                end
                case "line"
                    var a=two_p(pos_x,pos_y)
                    if(count==2)
                        ls=true
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(a)
                        ls=false
                        var l=new line
                        l.p1=p1
                        l.p2=p2
                        line_list.push_back(l)
                    end
                end
                case "two point"
                    var a=two_p(pos_x,pos_y)
                    if(count==2)
                        ls=true
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(a)
                        ls=false
                        var c=new circle
                        c.p1=p1
                        c.p2=p2
                        circle_list.push_back(c)
                    end
                end
                case "angle"
                    var a=three_p(pos_x,pos_y)
                    if(count==3)
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(count==2)
                        ls=true
                        end_window()
                        win.render()
                        continue
                    end
                    if(a)
                        ls=false
                        var ang=new angle
                        ang.p1=p1
                        ang.p2=p2
                        ang.p3=p3
                        angle_list.push_back(ang)
                    end
                end
                case "length"
                    var a=two_p(pos_x,pos_y)
                    if(count==2)
                        ls=true
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(a)
                        ls=false
                        var long=new length
                        long.p1=p1
                        long.p2=p2
                        length_list.push_back(long)
                    end
                end
                case "vertical line"
                    var a=line_point(pos_x,pos_y)
                    if(a==0)
                        end_window()
                        win.render()
                        continue
                    end
                    if(count==2)
                        ls=true
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(a==2)
                        ls=false
                        var vl=new vertical_line
                        vl.l1=l1
                        vl.p1=p1
                        var p=new point
                        p.move_able=false
                        p.look_able=false
                        point_list.push_back(p)
                        vl.p2=point_list.size()-1
                        line_list.push_back(vl)
                    end
                end
                case "parallel line"
                    var a=line_point(pos_x,pos_y)
                    if(a==0)
                        end_window()
                        win.render()
                        continue
                    end
                    if(count==2)
                        ls=true
                        count=1
                        end_window()
                        win.render()
                        continue
                    end
                    if(a==2)
                        ls=false
                        var pl=new parallel_line
                        pl.l1=l1
                        pl.p1=p1
                        var p=new point
                        p.move_able=false
                        p.look_able=false
                        point_list.push_back(p)
                        pl.p2=point_list.size()-1
                        line_list.push_back(pl)
                    end
                end
                case "move"
                    if(!point_list.empty())
                        if(count==0)
                            for i=0,i<=point_list.size()-1,i++
                                if((point_list.at(i).point_x-pos_x)^2+(point_list.at(i).point_y-pos_y)^2<=25&&point_list.at(i).move_able)
                                    jilu=i
                                    count=2
                                    break
                                end
                            end
                        end
                        if(count==2)
                            count=1
                            end_window()
                            win.render()
                            continue
                        end
                        if(count==1)
                                if(point_list.at(jilu).on_circle!=-1)
                                    var r=((point_list.at(circle_list.at(point_list.at(jilu).on_circle).p2).point_x-point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x)^2+(point_list.at(circle_list.at(point_list.at(jilu).on_circle).p2).point_y-point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_y)^2)^0.5
                                    if(pos_x>=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x+r)
                                        point_list.at(jilu).point_x=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x+r
                                        point_list.at(jilu).point_y=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_y
                                    else
                                        if(pos_x<=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x-r)
                                        point_list.at(jilu).point_x=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x-r
                                        point_list.at(jilu).point_y=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_y
                                        else
                                            point_list.at(jilu).point_x=pos_x
                                            if(pos_y>=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_y)
                                                point_list.at(jilu).point_y=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_y+(r^2-(pos_x-point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x)^2)^0.5
                                            else
                                                point_list.at(jilu).point_y=point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_y-(r^2-(pos_x-point_list.at(circle_list.at(point_list.at(jilu).on_circle).p1).point_x)^2)^0.5
                                            end
                                        end
                                    end
                                else
                                	if(point_list.at(jilu).on_line!=-1)
                                	    if(point_list.at(line_list.at(point_list.at(jilu).on_line).p1).point_x==point_list.at(line_list.at(point_list.at(jilu).on_line).p2).point_x)
                                	        point_list.at(jilu).point_y=pos_y
                                	    else
                                	        point_list.at(jilu).point_x=pos_x
                                	        point_list.at(jilu).point_y=(pos_x-point_list.at(line_list.at(point_list.at(jilu).on_line).p1).point_x)*(point_list.at(line_list.at(point_list.at(jilu).on_line).p1).point_y-point_list.at(line_list.at(point_list.at(jilu).on_line).p2).point_y)/(point_list.at(line_list.at(point_list.at(jilu).on_line).p1).point_x-point_list.at(line_list.at(point_list.at(jilu).on_line).p2).point_x)+point_list.at(line_list.at(point_list.at(jilu).on_line).p1).point_y
                                	    end
                                	else
                                	    point_list.at(jilu).point_x=pos_x
                                	    point_list.at(jilu).point_y=pos_y
                                	end
                                end
                            count=0
                            jilu=-1
                        end
                    end
                end
            end
        end
    end
    for i=0,i<=point_list.size()-1,i++
        if(typeid(point_list.at(i))==typeid(new mid_point))
            point_list.at(i).point_x=(point_list.at(point_list.at(i).p1).point_x+point_list.at(point_list.at(i).p2).point_x)/2
            point_list.at(i).point_y=(point_list.at(point_list.at(i).p1).point_y+point_list.at(point_list.at(i).p2).point_y)/2
        end
        if(typeid(point_list.at(i))==typeid(new crossover_point))
            if(point_list.at(i).cross_type=="ll")
                var d=(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)*(point_list.at(line_list.at(point_list.at(i).func2).p1).point_y-point_list.at(line_list.at(point_list.at(i).func2).p2).point_y)-(point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)*(point_list.at(line_list.at(point_list.at(i).func2).p1).point_x-point_list.at(line_list.at(point_list.at(i).func2).p2).point_x)
                if(d==0)
                    point_list.at(i).use_able=false
                else
                    point_list.at(i).use_able=true
                    point_list.at(i).point_x=(-((point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)*point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)*point_list.at(line_list.at(point_list.at(i).func1).p1).point_y)*(point_list.at(line_list.at(point_list.at(i).func2).p1).point_x-point_list.at(line_list.at(point_list.at(i).func2).p2).point_x)+((point_list.at(line_list.at(point_list.at(i).func2).p1).point_y-point_list.at(line_list.at(point_list.at(i).func2).p2).point_y)*point_list.at(line_list.at(point_list.at(i).func2).p1).point_x-(point_list.at(line_list.at(point_list.at(i).func2).p1).point_x-point_list.at(line_list.at(point_list.at(i).func2).p2).point_x)*point_list.at(line_list.at(point_list.at(i).func2).p1).point_y)*(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x))/d
                    point_list.at(i).point_y=(((point_list.at(line_list.at(point_list.at(i).func2).p1).point_y-point_list.at(line_list.at(point_list.at(i).func2).p2).point_y)*point_list.at(line_list.at(point_list.at(i).func2).p1).point_x-(point_list.at(line_list.at(point_list.at(i).func2).p1).point_x-point_list.at(line_list.at(point_list.at(i).func2).p2).point_x)*point_list.at(line_list.at(point_list.at(i).func2).p1).point_y)*(point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)-((point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)*point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)*point_list.at(line_list.at(point_list.at(i).func1).p1).point_y)*(point_list.at(line_list.at(point_list.at(i).func2).p1).point_y-point_list.at(line_list.at(point_list.at(i).func2).p2).point_y))/d
                end
            end
            if(point_list.at(i).cross_type=="lc")
                var r2=(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x-point_list.at(circle_list.at(point_list.at(i).func2).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_y-point_list.at(circle_list.at(point_list.at(i).func2).p2).point_y)^2
                if(math.abs(((point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p1).point_x)*(point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)-(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)*(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p1).point_y))/((point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)^2+(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)^2))>r2)
                    point_list.at(i).use_able=false
                else
                    point_list.at(i).use_able=true
                    if(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x!=point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)
                        var k=(point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(line_list.at(point_list.at(i).func1).p2).point_y)/(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(line_list.at(point_list.at(i).func1).p2).point_x)
                        var t=point_list.at(line_list.at(point_list.at(i).func1).p1).point_y-point_list.at(circle_list.at(point_list.at(i).func2).p1).point_y
                        var cross1_x=(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x+point_list.at(line_list.at(point_list.at(i).func1).p1).point_x*k^2-k*t+((point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x+point_list.at(line_list.at(point_list.at(i).func1).p1).point_x*k^2-k*t)^2-(k^2+1)*((point_list.at(line_list.at(point_list.at(i).func1).p1).point_x)^2*k^2+t^2-2*k*t*point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-r2+(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x)^2))^0.5)/(k^2+1)
                        var cross2_x=(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x+point_list.at(line_list.at(point_list.at(i).func1).p1).point_x*k^2-k*t-((point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x+point_list.at(line_list.at(point_list.at(i).func1).p1).point_x*k^2-k*t)^2-(k^2+1)*((point_list.at(line_list.at(point_list.at(i).func1).p1).point_x)^2*k^2+t^2-2*k*t*point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-r2+(point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x)^2))^0.5)/(k^2+1)
                        point_list.at(i).point_x=cross1_x
                        point_list.at(i).point_y=k*(cross1_x-point_list.at(line_list.at(point_list.at(i).func1).p1).point_x)+point_list.at(line_list.at(point_list.at(i).func1).p1).point_y
                        for v=0,v<=i-1,v++
                            if(typeid(point_list.at(v))==typeid(new crossover_point))
                                if(point_list.at(v).cross_type=="lc"&&point_list.at(i).func1==point_list.at(v).func1&&point_list.at(i).func2==point_list.at(v).func2)
                                    point_list.at(i).point_x=cross2_x
                                    point_list.at(i).point_y=k*(cross2_x-point_list.at(line_list.at(point_list.at(i).func1).p1).point_x)+point_list.at(line_list.at(point_list.at(i).func1).p1).point_y
                                    break
                                end
                            end
                        end
                    else
                        point_list.at(i).point_x=point_list.at(line_list.at(point_list.at(i).func1).p1).point_x
                        for v=0,v<=i-1,v++
                            if(typeid(point_list.at(v))==typeid(new crossover_point))
                                if(point_list.at(v).cross_type=="lc"&&point_list.at(i).func1==point_list.at(v).func1&&point_list.at(i).func2==point_list.at(v).func2)
                                    point_list.at(i).point_y=point_list.at(circle_list.at(point_list.at(i).func2).p1).point_y-(r2-(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x)^2)^0.5
                                    break
                                else
                                    point_list.at(i).point_y=point_list.at(circle_list.at(point_list.at(i).func2).p1).point_y+(r2-(point_list.at(line_list.at(point_list.at(i).func1).p1).point_x-point_list.at(circle_list.at(point_list.at(i).func2).p1).point_x)^2)^0.5
                                end
                            end
                        end
                    end
                end
            end
        end
        if(point_list.at(i).move_able)
            if(point_list.at(i).on_line!=-1)
                if(point_list.at(line_list.at(point_list.at(i).on_line).p1).point_x!=point_list.at(line_list.at(point_list.at(i).on_line).p2).point_x)
                    point_list.at(i).point_y=((point_list.at(i).point_x-point_list.at(line_list.at(point_list.at(i).on_line).p1).point_x)*(point_list.at(line_list.at(point_list.at(i).on_line).p1).point_y-point_list.at(line_list.at(point_list.at(i).on_line).p2).point_y)/(point_list.at(line_list.at(point_list.at(i).on_line).p1).point_x-point_list.at(line_list.at(point_list.at(i).on_line).p2).point_x))+point_list.at(line_list.at(point_list.at(i).on_line).p1).point_y
                else
                    point_list.at(i).point_x=point_list.at(line_list.at(point_list.at(i).on_line).p1).point_x
                end
            end
            if(point_list.at(i).on_circle!=-1)
                if(point_list.at(i).point_x>=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x+((point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_y)^2)^0.5)
                    point_list.at(i).point_y=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y
                    point_list.at(i).point_x=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x+((point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_y)^2)^0.5
                else
                    if(point_list.at(i).point_x<=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-((point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_y)^2)^0.5)
                        point_list.at(i).point_y=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y
                        point_list.at(i).point_x=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-((point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_y)^2)^0.5
                    else
                        if(point_list.at(i).point_y>=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y)
                            point_list.at(i).point_y=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y+((point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_y)^2-(point_list.at(i).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x)^2)^0.5
                        else
                            point_list.at(i).point_y=point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-((point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_x)^2+(point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_y-point_list.at(circle_list.at(point_list.at(i).on_circle).p2).point_y)^2-(point_list.at(i).point_x-point_list.at(circle_list.at(point_list.at(i).on_circle).p1).point_x)^2)^0.5
                        end
                    end
                end
            end
        end
        if(point_list.at(i).look_able&&point_list.at(i).use_able)
            add_circle_filled(vec2(point_list.at(i).point_x,point_list.at(i).point_y),5,vec4(0,0,0,1),30)
        end
    end
    for i=0,i<=line_list.size()-1,i++
        if(typeid(line_list.at(i))==typeid(new parallel_line))
            if(!point_list.at(line_list.at(i).p1).use_able||!point_list.at(line_list.at(i).p2).use_able||!line_list.at(line_list.at(i).l1).use_able)
                line_list.at(i).use_able=false
            else
                line_list.at(i).use_able=true
            end
            point_list.at(line_list.at(i).p2).point_x=point_list.at(line_list.at(i).p1).point_x-point_list.at(line_list.at(line_list.at(i).l1).p1).point_x+point_list.at(line_list.at(line_list.at(i).l1).p2).point_x
            point_list.at(line_list.at(i).p2).point_y=point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(line_list.at(i).l1).p1).point_y+point_list.at(line_list.at(line_list.at(i).l1).p2).point_y
        end
        if(typeid(line_list.at(i))==typeid(new vertical_line))
            if(!point_list.at(line_list.at(i).p1).use_able||!point_list.at(line_list.at(i).p2).use_able||!line_list.at(line_list.at(i).l1).use_able)
                line_list.at(i).use_able=false
            else
                line_list.at(i).use_able=true
            end
            point_list.at(line_list.at(i).p2).point_x=point_list.at(line_list.at(i).p1).point_x+point_list.at(line_list.at(line_list.at(i).l1).p1).point_y-point_list.at(line_list.at(line_list.at(i).l1).p2).point_y
            point_list.at(line_list.at(i).p2).point_y=point_list.at(line_list.at(i).p1).point_y-point_list.at(line_list.at(line_list.at(i).l1).p1).point_x+point_list.at(line_list.at(line_list.at(i).l1).p2).point_x
        end
        if(typeid(line_list.at(i))==typeid(new two_circle_line))
            var r1=((point_list.at(circle_list.at(line_list.at(i).c1).p2).point_x-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c1).p2).point_y-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2)^0.5
            var r2=((point_list.at(circle_list.at(line_list.at(i).c2).p2).point_x-point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p2).point_y-point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2)^0.5
            var distance=((point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x-point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y-point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2)^0.5
            if((!(r1+r2>distance&&math.abs(r1-r2)<distance))||(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x==point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x&&point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y==point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y))
                line_list.at(i).use_able=false
            else
                line_list.at(i).use_able=true
                if(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x!=point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x&&point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y!=point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)
                    point_list.at(line_list.at(i).p1).point_x=(r1^2-r2^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2-40*(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y))/(2*(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x))
                    point_list.at(line_list.at(i).p2).point_y=(r1^2-r2^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2)/(2*(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y))
                    point_list.at(line_list.at(i).p1).point_y=20
                    point_list.at(line_list.at(i).p2).point_x=0
                else
                    if(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x==point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x&&(circle_list.at(line_list.at(i).c1).p1).point_y!=(circle_list.at(line_list.at(i).c2).p1).point_y)
                        point_list.at(line_list.at(i).p1).point_y=(r1^2-r2^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)
                        point_list.at(line_list.at(i).p2).point_y=(r1^2-r2^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)
                        point_list.at(line_list.at(i).p1).point_x=10
                        point_list.at(line_list.at(i).p2).point_x=20
                    end
                    if(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x!=point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x&&(circle_list.at(line_list.at(i).c1).p1).point_y==(circle_list.at(line_list.at(i).c2).p1).point_y)
                        point_list.at(line_list.at(i).p1).point_y=10
                        point_list.at(line_list.at(i).p2).point_y=20
                        point_list.at(line_list.at(i).p1).point_x=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)
                        point_list.at(line_list.at(i).p2).point_x=(r1^2-r2^2+(point_list.at(circle_list.at(c2).p1).point_x)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)^2+(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_y)^2-(point_list.at(circle_list.at(line_list.at(i).c1).p1).point_y)^2)/2/(point_list.at(circle_list.at(line_list.at(i).c2).p1).point_x-point_list.at(circle_list.at(line_list.at(i).c1).p1).point_x)
                    end
                end
            end
        end
        if(!point_list.at(line_list.at(i).p1).use_able||!point_list.at(line_list.at(i).p2).use_able)
            line_list.at(i).use_able=false
        else
            line_list.at(i).use_able=true
        end
        if(line_list.at(i).look_able&&line_list.at(i).use_able)
            add_line(vec2(point_list.at(line_list.at(i).p1).point_x,point_list.at(line_list.at(i).p1).point_y),vec2(point_list.at(line_list.at(i).p2).point_x,point_list.at(line_list.at(i).p2).point_y),vec4(0,0,0,1),3)
        end
    end
    for i=0,i<=circle_list.size()-1,i++
        if(!point_list.at(circle_list.at(i).p1).use_able||!point_list.at(circle_list.at(i).p2).use_able)
            circle_list.at(i).use_able=false
        else
        	circle_list.at(i).use_able=true
        end
        if(circle_list.at(i).look_able&&circle_list.at(i).use_able)
            add_circle(vec2(point_list.at(circle_list.at(i).p1).point_x,point_list.at(circle_list.at(i).p1).point_y),((point_list.at(circle_list.at(i).p2).point_x-point_list.at(circle_list.at(i).p1).point_x)^2+(point_list.at(circle_list.at(i).p2).point_y-point_list.at(circle_list.at(i).p1).point_y)^2)^0.5,vec4(0,0,0,1),100,3)
        end
    end
    for i=0,i<=length_list.size()-1,i++
        text(to_string(((point_list.at(length_list.at(i).p1).point_x-point_list.at(length_list.at(i).p2).point_x)^2+(point_list.at(length_list.at(i).p1).point_y-point_list.at(length_list.at(i).p2).point_y)^2)^0.5/10))
    end
    for i=0,i<=angle_list.size()-1,i++
        text(to_string((math.acos(((point_list.at(angle_list.at(i).p3).point_x-point_list.at(angle_list.at(i).p2).point_x)*(point_list.at(angle_list.at(i).p1).point_x-point_list.at(angle_list.at(i).p2).point_x)+(point_list.at(angle_list.at(i).p3).point_y-point_list.at(angle_list.at(i).p2).point_y)*(point_list.at(angle_list.at(i).p1).point_y-point_list.at(angle_list.at(i).p2).point_y))/(((point_list.at(angle_list.at(i).p3).point_x-point_list.at(angle_list.at(i).p2).point_x)^2+(point_list.at(angle_list.at(i).p3).point_y-point_list.at(angle_list.at(i).p2).point_y)^2)*(((point_list.at(angle_list.at(i).p1).point_x-point_list.at(angle_list.at(i).p2).point_x)^2+(point_list.at(angle_list.at(i).p1).point_y-point_list.at(angle_list.at(i).p2).point_y)^2)))^0.5))/pi*180)+"d")
    end
    end_window()
    win.render()
end