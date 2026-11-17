Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906289;
	b=Ufplkk7/ntNNdhlgHquOztwkUm3eVPW8G6Ui3t+lh0PqHicWOi2VcQb89ebNM1yURqUw
	 bZvnew8RO/JlM8r7kozM4N/HRvgVvS+sCnw+SzN2HPc7JdK12vvJ3VbJmUEUNN2v4IEGt
	 0BxyFCgHGsn5QP36GR6GSykbYkWM89N8CZL3zCDLzSqnN9BEVuRaOYHbnJIOX0/PbytJ+
	 7wOudLPtRphktMZYqi6jBhNIu8vm5PGdtEpmFjhJ69SaiYI3W/jlKD/mU6ekAGHjA/NaB
	 VQA0V994EQAsQ5jbDmRrLfti6pr7v/CcTWiOyDwiUMFGL5uWpOvHh2HJcx3uJY8Q1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=aFbL7DPQrbwmV9RsnxDByez1wCBsyAJ2cbowb9paKWw=;
	b=oyTb2mIuAT2El9fZ4zCd2a9poK5SVv0Gfq+yyCfS15k98yVNDxZJrAeNkDKF+3yrmyM9
	 5rZfGGHpFB7dsZWprxtsN08FzAtfDLwnnLHwqn8oxtgnJOczOrWgkeolvoCWoqlLjUiM+
	 OYDxoV/jWfYM6aTn73n1sK2UQXzyviJD2tp2TtorQFatGmohQjkVmpaQGJOvAky6iPq0B
	 SPh7rkXCOP7WcUkcQR2gnqXCDe3Dt0peEYWXCmrIxxQH/SxsFOXVI3xOqZuNJTjVJSyyY
	 IKKr86SCBwOrD0BcAqcGCMv0n3ylEEq73jAvGzj8pqzJvr62uO3BxtQsqdOY4pJhWRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OLNEPudl;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF07606A8A3
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 09:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF07606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OLNEPudl
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso586620166b.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 01:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794906287; x=1795511087; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aFbL7DPQrbwmV9RsnxDByez1wCBsyAJ2cbowb9paKWw=;
        b=OLNEPudlN/JQ5mKVlrdBw69tawZJeqcdKCm07Jnc6LHgD33LwxY1A3Ho4mo1ARZy31
         OXlvKN46DxkKFIjo5d4RLqOtxoLvaQmlcLf/+oIBIAxHigwWGFcTv6pPu9Cm0hJKbJUk
         UFRP8c5d7tuvfnz8c0CyhhdZtQmQLZw7AnPWMv9RspC7DjqpsWlmbDBLhC8etbYpLh+R
         7XIM7A0LnFV2NZXHi3gAVcHs3pa8ExHOPK8RfDBh70YnUh9c8zZQaevk/hsndkRfzuFI
         uKZ3Uf8VdQsEpmCVQRiFabNczF+KhCWa1k5pUZ4y0J0J+jSUYx/bWBPEPviXyYIjYIKu
         Eu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906288; x=1795511088;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFbL7DPQrbwmV9RsnxDByez1wCBsyAJ2cbowb9paKWw=;
        b=AejChfnZHD99JYqbpDDaD1Px2z7Irkw6lx/hS2QrW0lucVIZJCHhOZZ5kWWBiTxK/X
         ATGH7X7pB/g3rR90GuaEOWZqI0FbCAMbjTtSqsrnjr2Z5x1NC/KZd363tWEvrzT7XJhn
         sVRTwMKLXpPgsgnrcJaENA3yZsLS8SgWJiqyi0S5909oQSZXTGrnr3HmFsekF/JjEeEV
         W0W7pk/LkxUncYKSbHp6q952NO4cGliO2wIb2IDiBsAF0mQGkEG6VY+QBXWu8xBPGeXh
         nVqhukqTz+qgtMRSZfqZQnDk01kJQeDSAjFxQNBPnNBEdQ9pMpoCY5FPMlT1SW5yz2qL
         PZSg==
X-Forwarded-Encrypted: i=1; AL+hErEADgSHWTYyhfgE2pujQYiE+gzMweGE0+gR2pDxm1BrgLsp9A6at0PvVg/HezCzh2c26/trcqh5ouryl0bGjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CDwiqdt6zv6uyiNB/RVzxAgJezWpzOOwQ3EeSnrKDkHHzOCcl
	xlxk+Y0kJIOF3/uk014PKHUbAXBD8KZCPhY77RckDxbtD7hb06GX25DM
X-Gm-Gg: AYBFou156eGopD7/5Ersi33W02HqsZjWvelECEn4mB9tIyEPcLRfMuEouKG3u78gRe/
	Dqi5QpgAu43dROyL7MFHs9vvQ0OgRfyMzmMPDi9Du/o7W3hsdivHCSM8cfnOAp9Ft+v8tkYcvxl
	UUotadFn1Nqn9fHmfYbIa8gcLfivEqxrvNG/tCeJJysXjcliX4g9huGQUqrwRO/FS6SpVFvZln3
	RJDrLMd5R6vfm4X0Z9ZH4goa0PZDVrvS4Qalv8HTAzNZWdUZgggDh+auXM3bgDSe0uzGGKg4J/2
	p74VNeMK76+YLOi1cWhVwLzv1mhHXJ/lplFctrjgYLf0W6Qpi64fGuLQbPDkrXjmxphKSWb8cFa
	rl9z1ejVO9AcV8zYclZboLoThqJ57catIL/TTMeAYxL6RPF8PaomqMDAueQJPRhRLh9wm9tUH5e
	CItF9OejMNCHLYrMlmokl/8xjFqBgcf12NddcVxMQpaZrxFLYg1PDrKs6tlT5U3uoB1Z/thwZ3r
	OOyJ9R0bwjKLlFZlEnIfWCfpYzn613a2/1JaM4rtABT0o/zJaoGdJIZbTcAGWzy+d5vmedv8HSL
	FIt1hFZvuAiJ8ZHeDG3BPpcS8fWm8clBTgUlqINHvCr10Wd8CxdIO8N6EwqQRy0XXu8YMoqxLDC
	gstW9iM1UGejBTIfqaLiRTQBKPyCbwSfjv8BtStVkuCVEhZw=
X-Received: by 2002:a17:907:a08e:b0:c50:a7ff:f880 with SMTP id a640c23a62f3a-c50a8000de5mr841456366b.34.1794906287414;
        Tue, 17 Nov 2026 01:04:47 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm24106161f8f.27.2026.11.17.01.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:04:47 -0800 (PST)
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
Date: Tue, 17 Nov 2026 10:04:46 +0100
Message-Id: <DMXD6CV42W7U.2MVL2J7R8J7W1@gmail.com>
Cc: <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on
 the same pdev
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Nicolas Escande" <nico.escande@gmail.com>, "Fernando Tapia"
 <fernan.tapia@fernandotapia.eu>, <ath11k@lists.infradead.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
 <DMXCW8192G9S.19BCMYODX8KSK@gmail.com>
In-Reply-To: <DMXCW8192G9S.19BCMYODX8KSK@gmail.com>

On Tue Nov 17, 2026 at 9:51 AM CET, Nicolas Escande wrote:
>
> Guys, I'm all for fixing bugs, but at some point you need to start readin=
g
> and searching the mailing list before pointing your LLM to any crashing
> target. This is the third time someone posted a fix for this issue:
>
> https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a3=
961795.1784792420.git.repk@triplefau.lt/
> https://lore.kernel.org/linux-wireless/20261001164139.370144-1-patricktla=
wler@gmail.com/

Even worse, 4 patches in total:
https://lore.kernel.org/linux-wireless/1316ed692b84f1d956e4854d9e974569a396=
1795.1784792420.git.repk@triplefau.lt/
https://lore.kernel.org/linux-wireless/20261001164139.370144-1-patricktlawl=
er@gmail.com/
https://lore.kernel.org/linux-wireless/20261026040302.2635133-1-dencity7@gm=
ail.com/
https://lore.kernel.org/linux-wireless/20261113120325.2913-1-fernan.tapia@f=
ernandotapia.eu/
