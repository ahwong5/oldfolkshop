class Billplz
  def self.create_bill_for(order)
    order = order    # same as self.order = order
    HTTParty.post('https://www.billplz.com/api/v3/bills'.to_str,
      headers: { "Content-Type" => 'application/json', 'Accept' => 'application/json'},
      body: {
        collection_id:    "5bsz0z3i",
        email:            order.user.email,
        name:             order.user.name,
        amount:           order.totalprice.to_f * 100, #Billplz currency unit is in cent
        callback_url:     "http://localhost:3000/webhooks/payment-callback",
        description:      "Old Folks Mall",
        due_at:           order.due_at,  #format YYYY-MM-DD
        redirect_url:     "http://locahost:3000/",
        deliver:          'false', # boolean value, don't SMS
        reference_1_label:  'Order Booking Ref',
        reference_1:      order.id
      }.to_json,
      basic_auth: {username: '95980a50-3d77-4b71-99ae-9d206c9be5a5:'}
      #last ':' is to omit password for billplz
      )
    end

    def self.check_status(order_id)
      order = order.find(order_id)
      url = "https://www.billplz.com/api/v3/bills" + order.bill_id
      #'application/json' is a type of http protocol content, could be text/hteml etc.
      #my server is sending request to billplz RESTful API, specifying the type of the content of the request.
      #Refer: http://tool.oschina.net/commons
      arguements = { headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'},
                      basic_auth: {username: 'c0354ec2-d33f-46d6-8fcd-ee390ffb741f:'}
                    }
      HTTParty.get(url, arguements)
    end
end
