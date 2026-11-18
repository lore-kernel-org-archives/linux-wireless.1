Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018473;
	b=Vrx2WRpo5HI+yi6dH7vdaR2a7wACh+XarkehJ3Chl+1QdrYUYYpNbHEIk/F1WOmitQT+
	 MrksB43jI0odnAMw1LEOO5K1I+4LnS0SkBHaQ8ILlhDjYZg9Fq1hBR/FhWS34sLEZzNfy
	 lkGHzaxZd6mPO0YR37n+HUuHBcXdDaI/+jUkrkSXXN8cXXz+eK2x4MlH291hCZdX4er07
	 GjqYTU6iuTWBsxIgFz/NQjgTYbZkN6MTFjgP6SZq/O5K75PXQqfy2KNruKQsAHrG9IXJj
	 is7YyJyTOu2ZbUzUerp/unW2srRXTbwLML5c0u/UMfyRVx1mmGEiI4tslKy1iczcRgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
	b=QPQa+utzNoqCX4+wNDZOmgQ2rTMOFpZY14ZmR0mcWldv0a80MhlP6nlggxjUkipoPp8h
	 +bh/zWvtaj/ri3luotlnpsG4QKrFnQhg2uzZ2v5GOg2vOoWvjYl1iNwIM35RIeTxzBMYG
	 hz0jzDei7Agn1lIekclLff2YVSpdmvPQjqAICzAcI+IAknhB7gp3rmbMz6w/g4RW3G8wd
	 McghaDsRPnlLyzGE3+p0qvyGkoUvGBawpHOp2f1AJibNYsJjf1URj4t54ioo/jierCaIn
	 ufbTwY5l3PTW96PAxaryZyNC/AZofnmA1I8I2Kf/AzzlUFnf8KVhfTu9zxirh1Q8aLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C96E606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 16:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C96E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso2779052a12.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018471; x=1795623271; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=N8cHuzSGx59kCzVaVvnnVDk+m0o/5FzrJte3k8qYPYBAfARJ7jS1mCpj1MFBk/8ZW9
         X+OfTRhuYHACV1grTRV7ntmN2SlvUZzZLFp5CtIoyP9ooDJ5c08mcoBgez6alR64ZtL/
         9XL20VL0fme5aCnLjXWVBXb4+AyWV1RYbTssZAZXTtlL5OdCBWcb3NChgu7RSw0TRJJd
         pS+Wz11rnhsmi4o3ezQuy/xAtokMN7lW+v1CRT0nFs+ZsUlkJWacXB46MHijaOdI4Mi9
         mrskFTmQmTk9qbVPdP1K0DZsXpX+Mi3+phzqlcnyfTe5JHGMeNY53i2/JiYH36bJsvNk
         e2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018471; x=1795623271;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=cTB61pbiO2CI+pOg+ovGS0fBW1LWGXTtXByWMp7l9G120SwGrBRQLXF2O0n3QVFDkl
         pIekDnkIRpTx3kb9K5WrwIqKbrosbrBneeMVrdiBgdXyXgzFE0eNZgJwE1z7lSKNF6VE
         R1JFN+79kgMDUVtZB3i/KZx7gXhBwx38GYwsojJekZSBs9av1IaAUzI1CUNKRuYtx9fM
         1uMp1YT5Bo3USTcS8u3+HG+v2AwWJc+i+ok7vTvfS0nOu+ZzDP0bUuKyFF8nOJ/OrLJC
         DKUYSeFPHe0D5iz4tjMfMVeK0CY8OhY0HQx/hirmnszH9E7CZyAEcUVxXr4KZoSGuDpZ
         9UDg==
X-Forwarded-Encrypted: i=1; AL+hErEiqqJHJOZMTOnkqJGEMSSlUs5Rc6ir8aLFvEDBxU+FyG0avl5LgPEtxqiXbaGpaxv3RrryQyRHNIKNeMoMxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dkQVLGZU9dTu/TLA3LCyzluykE4BfPgGPkYyISr1Zm78orFq/
	bImtG5ro2vkKs2UDNJfOYWClI+r2Y52DNO68nl0kudgM7PVFIjnbImz/w9d+RjDYQhY=
X-Gm-Gg: AYBFou0MIRPNHjlr6I/W8dwDv0Nhw78R2K+aFgaqc6Mdubtwioo+EMZaS8x+SEArbzf
	Rq+Da2M7h6TkeXOLY2qZikzNVdcdotqm5UmMTVSfj99jatpKaFFaxgZagQ7k6bFyTDh1cAhYZz7
	eydgNFhcoqadEJONzQq5ipEBr0/PbKADmmxBBAXs9OCequfcV8fWzKuU88WaW3z7OE93/GDEmEJ
	21rbXPz280pcGMhy0b0XDKZXYJwkhim2zhzKSHYFyvNOz3jsYdFdxBB5bOlfXmRop3bzQN9esIs
	eh4hxaiZwSARBtet+A2aC+qIC94QM7r3mvgbGt0mQWREuMGIsd24Zh47D4HZZdaSxp57ymx128O
	S145mOHwXqHvMUpsaiJsY6XF+E90Kl7tK51uywZxo+8dtc8/0HKU4SUsdXK2W/OiEHERTWJz0Q7
	bnrWAzV2D5fmVHvnsY53Ob9WOmgwBymzi5wuOktKXA/no5SLQ7Sjk9VEblETFOi3NgRv0dNz66i
	reU/AZSqbkpxfJA8lsZziWud8320KenufTUBExr0GTa0V0ugWZjmExacWzmyZKK7SF7FwDEiw2W
	QufJt6NYC/P4XVfTfgo83R/I82J10hjzbUd/7hxdEcrKSRVMgNOd9/npk+9Q8KE18aPtbLFSHA=
	=
X-Received: by 2002:a05:6402:5409:b0:6b6:7231:7ebc with SMTP id 4fb4d7f45d1cf-6b887e50d5emr2734312a12.14.1795018470789;
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef94b0sm1356826a12.5.2026.11.18.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
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
Date: Wed, 18 Nov 2026 17:14:30 +0100
Message-Id: <DMYGXX4GAHRV.2I4NFHBVVJG0V@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:57 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.

Looks sane, I've had plenty issues like this before with other SoCs.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>  					wifi {
>  						compatible =3D "qcom,wcnss-wlan";
> =20
> -						interrupts =3D <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> -							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
> +						interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  						interrupt-names =3D "tx", "rx";
> =20
>  						qcom,smem-states =3D <&apps_smsm 10>, <&apps_smsm 9>;


