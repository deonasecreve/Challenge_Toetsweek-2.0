@extends('scaffold-interface.layouts.app')
@section('title','Index')
@section('content')

<section class="content">
    <h1>
        Timeday Index
    </h1>
    <form class = 'col s3' method = 'get' action = '{!!url("timeday")!!}/create'>
        <button class = 'btn btn-primary' type = 'submit'>Create New timeday</button>
    </form>
    <br>
    <br>
    <table class = "table table-striped table-bordered table-hover" style = 'background:#fff'>
        <thead>
            <th>date_appointment</th>
            <th>actions</th>
        </thead>
        <tbody>
            @foreach($timedays as $timeday) 
            <tr>
                <td>{!!$timeday->date_appointment!!}</td>
                <td>
                    <a data-toggle="modal" data-target="#myModal" class = 'delete btn btn-danger btn-xs' data-link = "/timeday/{!!$timeday->id!!}/deleteMsg" ><i class = 'material-icons'>delete</i></a>
                    <a href = '#' class = 'viewEdit btn btn-primary btn-xs' data-link = '/timeday/{!!$timeday->id!!}/edit'><i class = 'material-icons'>edit</i></a>
                    <a href = '#' class = 'viewShow btn btn-warning btn-xs' data-link = '/timeday/{!!$timeday->id!!}'><i class = 'material-icons'>info</i></a>
                </td>
            </tr>
            @endforeach 
        </tbody>
    </table>
    {!! $timedays->render() !!}

</section>
@endsection