const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //公開鍵を環境変数で
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_buy[card-number]"),
      cvc: formData.get("user_buy[card-cvc]"),
      exp_month: formData.get("user_buy[card-exp-month]"),
      exp_year: `20${formData.get("user_buy[card-exp-year]")}`,
    };
    

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        
      }
    });
  });
};
window.addEventListener("load", pay);