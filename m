Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018404;
	b=XGIDfSW6x1APQVwrhC+9Nmi1KT6+aSgSowryUj3qGJZkFS/zMtaYq8doyfEFoD1HbWOV
	 S9IA4FLyGtdY9ZmdKj/knNfepmmR4FWpCOX84PYZOncFgiqwdAl0tCmHTnq+86KaiwU46
	 WHUSyZMjDuchF6DjqFfpXNjCGZcZDrHSoRR3dS6KB79ytE3NzZwHpDd+Evj7C/XNoz0NT
	 pGa8MDcGQdjp62XILRobtKcZgiYmW9UVPTvf7t2t8SROHMd8LKxH1mRa15PJvX9k4oESv
	 hhVUPwt20Oe2cHDjtk3nOrbxhp5akmyjQwlG/uTP9FZFZSoVCNRrCv1nhgvRp03V6/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
	b=mF24snuGI64F7IM+X+vBe37GAnoFwLdbAucKevMry/Uuh77KRIU8TPa4u3D0/KHmLEzQ
	 HRq7X4jJ8Fn505lpCY46+jvDym3iqfY4v4M3KdHAvQeJ1sVvubIHsCdkNsamTW9vU7v7b
	 N4R8gOi/ve+Li6iy97uTpUnuCmOewou2VA0vSC024fFNgwPa76lXKA3hyE6pZOo75jnPD
	 I8kXs86bDVC6tY2Vpa1dhcN+CKbKlPx+XEUFqM3eQKJKmMG3ZtUEAquUD6iUUwoeIsgNW
	 YfF8196ls0m+6BY0Vz3x/ydBsC5gkDGAOv/zUGbjvCY0yIV+gYkH76KqyaqmShBijWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FV0bltX0;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E31C606A331
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E31C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=FV0bltX0
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so1638166a12.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018401; x=1795623201; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
        b=FV0bltX0oekj6/9f3wa9B0/l8zl9COMFFyQ5EAruEn6+3u8/cdTM5/fAof+ws1va0+
         9V7ZDTR58f1agBhb7jH2ZL23CYfYjNxO9GWe5UnzWp/TDmnnGY2nLr8Kic0Ewgy0cvoj
         0YFwCl6ZFhMviqdtHWJ7uNUE7iVBQ9qja0BQtawatKhVTmELVv/qTlkkbMn7FFPzE7+t
         eXoRoWgCAjRLWh80ANeC3KOnPoeMh687hvXa8XsLwshJmADDY3F0N9ej++7BVjTBWgni
         JzCzrJrBRgmsz6I5zgmhaUZ9e6xoF5WOnjD/Gel1Oxr/msrr91dJmbK9CBW/d0LiXQ9B
         CBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018401; x=1795623201;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lq/7sTlAJbfIIqLa7wmAuF2tMNPuQ+wGipfJEmlBdE=;
        b=OOhq6wZRcsAOVfHxWPI6/W9e26pUAeMa7CcRfNDVldHfHRVBUbnEtM5YewDjsn+HeF
         HHuAdP7OYF5vG2kRG3GMKYgu5sbqKtOGW2omdAZqnqrNpUdAsgyZJRdEzTrJRdjKZxJq
         DGI6olSWcMej16UWzuXA22dFPU7bGOMU1gnNtshmql4KoaYDBDlGhow/t7LRsWkLBHGa
         kKLXjECi8ByC685XMzDnnfCNXzt0KolyFhMqb9znqgnvmYrGoPJvR/MoT520vhlt8iMk
         Cx48ngT1oBXKwuHsel75uf6WNqN6hRLkNPaAGc/VV3GG10RZo3JzwUlCdYv2TF8HQZSY
         D/ow==
X-Forwarded-Encrypted: i=1; AL+hErGYAIFksF+MJi52EFTCCEZAGUnJhlqwLg7c3pHYQm1WLb1Cbyy5NknBvQqBtHOyTXV4iF3s2KRPRAiAQzaA+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+NljSd8dRdNPv23H0/em+KwnNTRRwFm9SiFjv3LMqNNDf29WLS
	iO4swy5y9Tk1hU82gnWcNCFKL6tkIZ7ioSEp5ZCu70S7Reo0Gfn5EWnp/2Sjst+W8CU=
X-Gm-Gg: AYBFou3gmytJtY5Hp0Tst/kGSdHDA6JRj23Rc5Px6LCtK+felQORoyyY6p3TIFBoylD
	enk/A7Vqgc/02yDCQRCkINh/7u06Z2qHv3ReAcDzxiDyd8fMutwDvhQaYm/MNOvhFcDaHzlXhNZ
	myusjq6thhJ8HogmLL/R16O1v1EfMhhXgaZ5PT++pvQdziUWEf6qBC0r5BLQ8PqOmqf2X0Fnpzp
	EKOf/nmM75AC1KsOWB14rgwpLIXcsyWiVxtxPXBEJgrQgl9xTu+Eqp8SD5fdunCsvEiM2IUD08g
	Xnq1oMHQqeOk+80IJUWSzKvHWcwAef1FiLSo7q1uZOY3JD1CnTHAW+HIXqiSy57OKoYDH3zIf0X
	cSle7jN4K2n2lAOO5tvVJMTqy9QJQO47vA6O89FLP3DriyHpN9+Gwj4fS06yPZNL9dYTKYmf3e8
	s5cJe0IGvnoLSNMTue6N0m6YRXcDs6DENtKn395UGTUFdFRhMDZNOhvbJlH7wKlGDHk1sq/8/CV
	XoGFh1fMsMwO0B/Fhc9CVYamFz8FjtPqFEn0cBWrYUkReDOB5oqIffe1eMwcYKIU07U7ijkGPg1
	sGn2T6cawP5IgxnxIAlvRvbJAGrDq5mj8+kH1e90e3evTN5ctd3uW69da1M04CxjPqRdIUO4bQ=
	=
X-Received: by 2002:a05:6402:693:b0:6b7:5712:f13e with SMTP id 4fb4d7f45d1cf-6b887e9a998mr2171788a12.21.1795018401363;
        Wed, 18 Nov 2026 08:13:21 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a6fc230sm1256698a12.36.2026.11.18.08.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:13:21 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:13:20 +0100
Message-Id: <DMYGX16XPQEY.PD4MUZN1IINL@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 2/3] wifi: wcn36xx: Do not enforce interrupt trigger
 type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-2-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:58 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> Forcing IRQF_TRIGGER_HIGH over the DT type makes the re-probe after a WCN=
SS
> restart fail ("type mismatch, failed to map hwirq"). Rely on the DT, as
> commit 1ee6c5abebd3 ("ath10k: do not enforce interrupt trigger type") did=
.

Worth noting, that all upstream dts files that use qcom,wcnss-wlan
(apart from msm8974.dtsi which is getting updated in this series) are
already using IRQ_TYPE_LEVEL_HIGH, so this should not change behavior
for any other SoC.

>
> Fixes: 8e84c2582169 ("wcn36xx: mac80211 driver for Qualcomm WCN3660/WCN36=
80 hardware")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>  	int ret;
> =20
> -	ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -			  IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +	ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +			  "wcn36xx_tx", wcn);
>  	if (ret) {
>  		wcn36xx_err("failed to alloc tx irq\n");
>  		goto out_err;
>  	}
> =20
> -	ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGGER_HIG=
H,
> +	ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>  			  "wcn36xx_rx", wcn);
>  	if (ret) {
>  		wcn36xx_err("failed to alloc rx irq\n");


