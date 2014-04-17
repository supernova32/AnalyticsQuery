jQuery ->
  xinspect = (obj) ->
    str = ""
    for k of obj
      #omit this test if you want to see built-in properties
      str += k + " = " + obj[k] + "\n"  if obj.hasOwnProperty(k)
    alert str

  $("#add").click (e) ->
    $("#selectors").append($("<div>").load("/select #content"))


  $("#apply").click (e) ->
    data = {}
    $(".filter_container").each ->
      attr = $(this).children(".filter").val()
      temp_data =
        op: $(this).children(".operator").val()
        value: $(this).children("#value").val()
      data[attr] = temp_data

    $.post "/filter_keywords", data, ((response) ->
      $("#results").empty()
      for k, value of response
        $("#results").append "<tr><td>" + value['_id']['keyword'] + "</td><td>" + value['num'] + "</td><td>"  + value['costs'] + "</td><td>" + value['earnings']  + "</td><td>" + value['ci'] + "</td><td>" + value['co'] + "</td><td>" + value['ctr'] + "</td><td>" + value['cpc'] + "</td><td>" + value['epc'] + "</td><td>" + value['cpc_last'] + "</td></tr>"
    ), "json"
