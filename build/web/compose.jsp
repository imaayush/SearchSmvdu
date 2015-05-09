
<form action="Sendemail" method="post" >
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">New Message</h4>
                </div>
                <div class="modal-body" >

                    <div class="form-group">
                        <div class="input-icon right">

                            <input id="email" type="email" placeholder="Recipients email" class="form-control" name="receiveremail" required></div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon right">

                            <input id="inputPassword" type="text" placeholder="Subject" class="form-control" name="sub" required></div>
                    </div>
                    <div class="form-group">
                        <div class="input-icon right">
                            <textarea rows="8" cols="50" class="form-control" name="body" required></textarea>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Send</button>
                </div>
            </div>
        </div>
    </div>
</form>