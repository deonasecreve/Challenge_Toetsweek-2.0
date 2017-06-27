@extends('scaffold-interface.layouts.app')
@section('title','Edit')
@section('content')

<section class="content">
    <h1>
        Edit timeday
    </h1>
    <form method = 'get' action = '{!!url("timeday")!!}'>
        <button class = 'btn btn-danger'>timeday Index</button>
    </form>
    <br>
    <form method = 'POST' action = '{!! url("timeday")!!}/{!!$timeday->
        id!!}/update'> 
        <input type = 'hidden' name = '_token' value = '{{Session::token()}}'>
        <div class="form-group">
            <label for="date_appointment">date_appointment</label>
            <input id="date_appointment" name = "date_appointment" type="text" class="form-control" value="{!!$timeday->
            date_appointment!!}"> 
        </div>
        <button class = 'btn btn-primary' type ='submit'>Update</button>
    </form>
</section>
@endsection