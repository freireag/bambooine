class PaymentMailer < ActionMailer::Base
  def payment_warning(student)
    recipients student.email
    from "Sistema Quality admin@freireag.com"
    subject "Aviso de Pagamento"
    sent_on Time.now
    body :student => student
  end

end

