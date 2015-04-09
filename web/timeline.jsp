
<%@taglib uri="/struts-tags" prefix="s" %>

<div id="tab-timeline" class="tab-pane fade in active" style="background-color: white;">


    
    <div class="timeline-centered timeline-sm" style="background-color:#EFF3F4;padding-top:2%;padding: 2%; ">
        <div class="col-lg-12">
        <s:iterator  value="loginfo">  
            <fieldset class="col-lg-12" style="width:100%">
                <s:set name="active1" value="active"/>
                <s:if test="%{#active1=='Liked'}">
                  
                    <article class="timeline-entry" >
                        
                        <div class="timeline-entry-inner " >
                            <time datetime="2014-01-10T03:45" class="timeline-time"><span>12:45 AM</span><span>Today</span></time>
                            <div class="timeline-icon bg-violet"><i class="fa fa-exclamation"></i></div>
                            <div class="timeline-label"><h4 class="timeline-title"><s:property value="active"/></h4>

                                <p> you are liked <s:property value="activeid"/></p></div>
                        </div>
                        
                    </article>
                   
                </s:if>
                <s:else>


                    <article class="timeline-entry left-aligned">
                        <div class="timeline-entry-inner">
                            <time datetime="2014-01-10T03:45" class="timeline-time"><span>9:15 AM</span><span>Today</span></time>
                            <div class="timeline-icon bg-green"><i class="fa fa-group"></i></div>
                            <div class="timeline-label bg-green"><h4 class="timeline-title"><s:property value="active"/></h4>

                                <p> Your add in circle <s:property value="activeid"/></p></div>
                        </div>
                    </article>
                </s:else>
            </fieldset>
        </s:iterator> 
    </div>
    </div>
</div>