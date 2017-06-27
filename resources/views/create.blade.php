@extends('scaffold-interface.layouts.app')
@section('title','Create')
@section('content')

<section class="content">
    <h1>
        Create timeday
    </h1>
    <form method = 'get' action = '{!!url("timeday")!!}'>
        <button class = 'btn btn-danger'>timeday Index</button>
    </form>
    <br>
    <form method = 'POST' action = '{!!url("timeday")!!}'>
        <input type = 'hidden' name = '_token' value = '{{Session::token()}}'>
        <div class="form-group">
            <label for="date_appointment">date_appointment</label>
            <input id="date_appointment" name = "date_appointment" type="text" class="form-control">
        </div>
        <button class = 'btn btn-primary' type ='submit'>Create</button>
    </form>
</section>
@endsection