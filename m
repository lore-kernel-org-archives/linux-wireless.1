Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794605670;
	b=tjVaHVj56vh6Fq3hHcbG4QVDMmDqOAv9kKGwkvE88qQFa/XSKrKXEtJceawP4i+gxIOU
	 Ke/eTL5PTNfNP7nvZFAbnzMOc54T5Axn11PMC0y7k6cYdxcYqhj2iGzc/e/r2OyMIuV3+
	 msU+g8qq23pqa+ruqJjWQq6XHh/bwrhMotiy2ZLI3ymv0HqDivCpl2fmWfgqJMeVgOXBR
	 LTxXOj5ImU/uI5D6a0ecGYr+rTJupnS4PzlJDjme6hhfkrqCUHNcZ06gaNWPp/h2roIC5
	 GqTa/VHhNjwU6yeekifDRBTM0LUksRYOuQs1gRgaaAQjcrAhoPNcbIPOn5Q7qUpbb7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
	b=AtmgVLwl9ykjT7IsdzztExITNa/3iCqe7r1ROXHyZvVBWWJ7KUQnmzKJWBhk1PuXKsSp
	 e++BLZuA+LwpES1Vv4fljLlUg7CcWIEyG/Crkp6t5RhPmMQQ+mXlPBPcVj04McOzyhgJF
	 RS7L5L8DJ4FnmImfv6Vm63q/o6zU6oC09mdZBOkDx7ZIVADEDJFOv5KXWed3oEvnwsQwV
	 kwe4sytpRSIPncNrVF/5TSCnpOrdVlnsjYz6eiVro+Q7rhMjCwfiddFNRB2WOKLEB5dpN
	 Lo0+7SSIRxbFhOD77Pvhklauon6WiAFuElcHcyBbI9qtnhxR5MOdlxsb+EvZmtrWEow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6Zz1mY3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D54A606A327
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 21:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D54A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6Zz1mY3
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2870650a12.2
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 13:34:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605668; cv=none;
        d=google.com; s=arc-20260327;
        b=pa1btI+MW3DyTN0365iSkHoldMSpqkCQGo4dQ+k725W/xw716I+wNUo/CY8l4w+qau
         m/P1DSravHrO3DR4dgIOl8rSehX6E4TYQr6VlLnUcyB6pYIVkfXGw60hX1P2FoCY2BGq
         F9jI2q4ZXBdZ/bGzr6ls6kvYJ9DYCFOgD3yXcImLztpeyMaQSw99hKVORKyF6zGe1wrk
         CYd3eh0H+cpnyvqOsqOOWJ2cOyitX3TaKZpAo1yXyDk6DoAQW7PvXIIUa9mGWFii3S8g
         H/uwimROP+S5bmOrel30LJ9GNc71moQ1ZGLMaJcNXKBSYKMD7pvDG2dJyNXTi130uefP
         e5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        fh=Yrvo1/uXqYDEUL/iHeRIDFzzriuD4w5J1YiJzXy+6ps=;
        b=DM1GXVCl3aTNWyzSv/ddFd/NBNE+ukaM9NK4SBIZjGzMzVzdK5uTrcwBeR8aPqLiZt
         2+UxZxuCZW41vjCAj8BXJsLYb38NBNgM54UpBWb2BHCnI0G96DjktLogx8rY9aLZPUdn
         yQMym7k3PeWjrQ2zVTyZd7SlPhtPL4UHKwhEGqv+fmrdKPXdj49plNq4sp9Ys3zPpaHm
         Y3c/y2ofTx6khzJZsnhqFbX/+yjgXgtR7zCkSExfAtPePaH5gRixJvN4P8GKKnPXT97H
         sJyJTLdAGfbvMVLFlJ+iF8IO2jECmVRRhyT4PF1YJNE0Ov1C20TUwjugrrndsIcBTQx0
         KjoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605668; x=1795210468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=n6Zz1mY3OwnMRux9AIi8h3mMM8K/rdexRAXliMbI7BUAeRbFl5+myZIoZntCimF8Gh
         NRFXIgPkWX/XM25RdeuiL4uKgE4qBsXMFNPKRRGN9AypAcEYXtdDkayrgRITRAP116u0
         TrsYowDxQL8tggHBaLER/J4IKU/BsHTwzLTco17LuHBVBDXEGn0cccQWQpL0pMg7NpBA
         DMWTxB9UXxK4HysvunwnGs78kAETl4RiQMdZbfsTr45AujcYPUU4AwQLAD1jEjVvLGc5
         NVzTn2sXhZooZEFd0LVw38BEJHFLDvvmyZuwv7M6IE1Gs2PM/5oYmKBrgAj10tQhRtOh
         uULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605668; x=1795210468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nh80pnuDouex8FDarEIC9U9q4E6rNEI3YqKmaUcXBh0=;
        b=G0YjXVhf13teXdghefF1JAoyCfc27iA86qH/TQzQYNl2C8icgPb77hJPnvzOKnKann
         DkhcYkYIxRYAA10/j89qE2fON0AeTKDZclwhC0nF6+O8fCMvmn5dBCHfaeZu7yBW0mkq
         0wFPV6XkNvBi99S9xtbRlDbsXuTXcGRR4oIf4/x2YI0WzTuHSx6Syt2MudKEMws/Km8U
         68FItfE48WhHbmH6JXGRAgD+H0uqXrMSVerff3smWkApzF1+iof06mS+m2PGjW/ztpdt
         grPdw5X8c1bLjQN/kiUTIRoyoYZ4ozNio3y30WGjajwUqIj1y/qe2UfeBjnNkUM+rGnx
         tB4A==
X-Forwarded-Encrypted: i=1; AL+hErG1HC2rzYzUjd/VSrr5zUr9oitnDRZOprxkmLr9eRieEL+0D9BMkCyjnMc68WQgac61lle/xkMyTw9uO+wl/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/zD2wejdojf2Ye54kns6lGvYGvZjcVR7DExxSoSfjDS2CK+x2i
	7y71NSKT4CQKiHGkCd2UMNqLf8i7k0zponB3FfXHcMJj1jcP2P8VALXWc1KumqlnfBEYs0KKGtv
	DQSSNwIp2RwCP9x7V2jeB1MBUcs3SNRw=
X-Gm-Gg: AYBFou3OQMwem0q6QBqALxdQDgjdf9tmWKvtU2A3XsmC0fwTqg74VzjE6NyURgkgZo1
	K3KIT2Kf1yO386MKnfoiGQ8HCNzkdaLG8U8OOs7Awspq2LtYaXxRKMK6DhtIIir02g8J0oXQraH
	Q1rzu0C5ni00Cmt1fsL4zNn1NvzHBEH5rbIQx7x3ZD6H5c9ZwyKwL41Xjlkr2oU8niyHEwcU26F
	56pAY559Vjy+7xJd+7QUmfe7FSBBTpoboVNrbHSMaj5w8sMSlJaE+x7YRkD+kDvsa43D7iKwtHI
	2XT493O+lN8ZNoPkHzTqGucmbVvRw5j2gThzp5MNabXvylAxYogILiTsvM/GTGAY79wHyyndocn
	UWrkM7W85f6vOhtLW9HpSnqRQ4u3B2X1DKFjD26D+CDr/87EF1DkjVP5Zd7MAAgcRgkQBLbMPD7
	2q9NNqHhO8bdxviZsVnfAAbQB1BG6CKQzOHfW652x/gVaJ14mMcyirYMKMrGyPOOI3ItD8Al0FA
	5KVEHlgApZ0V40NiaX6Bc9gJYSqx6htfKuW0o8b0/x/QkP0yA==
X-Received: by 2002:a05:6402:2422:b0:6b4:2960:d38e with SMTP id
 4fb4d7f45d1cf-6b7c0c6c168mr3184743a12.26.1794605668245; Fri, 13 Nov 2026
 13:34:28 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111034418.194610-1-rosenp@gmail.com> <20261113-gabby-vigorous-dragon-6a2fed@quoll>
In-Reply-To: <20261113-gabby-vigorous-dragon-6a2fed@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 13 Nov 2026 13:34:17 -0800
X-Gm-Features: AclHuK860Je_aBBSmUpm949DigIPgWY0YZ3IdWomRfLhm8LCUntc7TDGkYsdgmQ
Message-ID: <CAKxU2N846Ebd50z8adJsNcy-kJBSNDSKU8_ZLf68fJzoc+r+xA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 10, 2026 at 07:44:18PM -0800, Rosen Penev wrote:
> > ath10k PCI devices can be described as children of their PCI host
> > bridge, for example to supply the MAC address and calibration data
> > through nvmem cells. The only compatible for that was "qcom,ath10k",
> > but the generic PCI device schema requires a node under a PCI bus to
> > carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
> > validation.
> >
> > Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
> > ath9k and ath11k PCI bindings already do.
>
> We do not need to least all PCI devices here. Were is any actual DTS
> user of these?
I have some WIP patches that include the QCA988X. Reason for it is
nvram calibration and MAC lookup.

This is basically copy/paste of what's already present in ath9k.yaml.

AFAIK this came up because of dtbs_check
>
> Best regards,
> Krzysztof
>
