Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164545;
	b=rJ63TWs+zL4xYR9vs7q8xL39e8QHWQ8HHOfyVHjNxU5ix0phZb9LnAm95ILsrCKG1NYT
	 pyrIpjHdRyzNvdn/OouVorX0Z8CLb8yq3HaCT6FJviWyoe6Hfo716fYppMGglN55TKOWN
	 gZpGqotoWBwonZ8H2a4sntnwQvjoW90KCLUkWbxh8nYRJOYb2WdGNxLtbxu5R1C/MUos1
	 pTtur8EmtkGAfINKEaE3Qp07CQF6YvegBOxvd5gspH5BJwLNNwn336KIg42F7GrKcZBKV
	 g2oKXHyQFfB3QRoGRNBfRQM7uHAMh5DEXMMGOfD6dWIYejQP09DvIyQFNapd91vMUWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=7jRS+HEkcaytN3nc9pnUZ9I9MCe24w4aiJu9/xx2cww=;
	b=XGgKWAbwmGWkdm4+U8PMYF1T1qPdXLtJPHZzPHdqI7XuyanRjBIF1pwccu0t+5RM8kNs
	 WNLtlmY4v9C0PahgrrsWraoIfk5+nLlDrIdW7YtN9CGGiNCzbUD/Qk1sSK+1p62ZuSiXf
	 LEHgnRsGfY8Ae5IDkYKoHcqTbqsFEcn1ZVmBUdoJ1AU2i+UIWAXvzHeI8J6SzczrNmHWQ
	 KqZ6g5C8vpnB+kZzCLPPZAZ+e2GSbDLgRserJcaXSmFpifQDx0Bac7PQa9XWj2g+2ZsJd
	 qzmgD9MugB+LAx9UPwHLGWahr+1i1BqPSgtMu5FwBxwrWrtyl2NXD+DzNvoMTbkCrrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsMZO7w6;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DB3606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80DB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsMZO7w6
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382c3c9671fso882943eec.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 00:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164544; x=1795769344; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7jRS+HEkcaytN3nc9pnUZ9I9MCe24w4aiJu9/xx2cww=;
        b=TsMZO7w6Zpfot71BmLyL/m4J6dlExCO6AWgtZrDzXzudQYxsIq6GIzV5YzlW7vYupB
         5OK3LaRMlff/U6z4+agFmnMmeaBtiJwaPxf1NYi5TgeTMWz16M4yS4Hw2fiugFCH3dyd
         eqcW/W8BusTjb/Sf3BfsV876c1kpwCDv2Ymm0eyCozDPK4aIcld0cgw9jXEs1Jnh4G1C
         w60tpeokPbjfV+OgVmS74l+jPZkjFnqrzlfRIUbWvmSA7GPKL7IGscourfSuEFLr/2C1
         WJCZm0htOMstVJRzwfYB3s8Ytpkv1KXKfUT395ZXNDDx6fcn1mADMwa+m+Omwu4sNYNX
         XB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164544; x=1795769344;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jRS+HEkcaytN3nc9pnUZ9I9MCe24w4aiJu9/xx2cww=;
        b=AygXz8Ow6ucVBFtj66G1AdnItNmq0KS16hQh8vihxdxWD66FyjQj5Ace8nbyQiDWll
         VUENDF7PaCvgsV7gAlC6J9ShngoXbZ2zPlFCK0J2CECE1HGA76RXJSiUaSnoXc/gYjvG
         lFguX4jO5COH/qSmJR8F4oE1B5Xmv7E68bqmlt84t8lNB+FBzCvlxOQZNt4dcAX49iGN
         ulrLi2ZapyVK6yWMVVDQ3BCrMXUJOXmqpJsv/KL64ntEFVZKGOm5u1M++OLgcq07HQ4z
         Hk2Rsw63pXgl5RmjyLkJbqP0nLq6Ytu8oglYnRWtNMRgThTYzVVcS3GFGpnMTitzF/2F
         Ue1g==
X-Forwarded-Encrypted: i=1; AL+hErFZI9Hdiacli11LdM95MIbjh8V6JVuodQNalVB7kXgInv0yFAAUk8VXSk/HBayqKW4Pd2TgAaoX0ufZ4qg6Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FmW/pS6El9Amvxfiu3+Fja82Okzl7n2I0ioApJKHdsdhKdUyz
	QTpmMbmj/wwihVwQrTVJtykeAHnnV8u5dNj5KYvFgmTV/0DKCSAd+pee
X-Gm-Gg: AYBFou0/jTvIjwpSRcKGQusLVbyvBXix89Iv6yYvTByO8EyoFfmUQq8QGpDYTmsZoEY
	WeGK+ZlLPnMeYDFulwMLLlgJZlAaQPlZx9Xmr9QHrh6zymCbMW5oHQt4V1PostPTu3a//23ffWG
	7wBDslBPKoNlEApAy9XDNuUwZU8nv1J1ISdjbUQnqM+ZFC32H8K7fto3MuNco+DwXfjytjipWEu
	q4tSzwDW1414Kr5D+hLmKOu9mF4rGDLmTqRbg/i+M6BcKNQnOJehTS0xbfF03vvUb1F0/gD0di6
	pC8wxO1XoaNny0wdPvMLo3f7opyDKtU6bRZRrbIL5WwmOrNjo988iVnJNhYKKNgshcxHDZ68YBD
	GctBhzTydpRFXcZ2pDr7IGaUM5TgC0wycz+ZJ04NKrIAJwYclgevu/vGRHWI3BSWH2tNJdhXvBU
	pElr95KM6uspesTy7VGZR077wLMs6vUMyW8vZo7wDjCt0xlQdLDCWirjmQPakfgjhj1ajsYz59j
	O59Sg8gzH2oQ7cOfoNPkvY60hZ5vYl5OokqQ5Yp1skNoQD4Y0didYwIz6xvmqkPhy7aRoZProjT
	sfCG3CO5DOqiZsmwMGU4ZY4jjiDuQx+LCh+jp9l75v7lYqDYFlcHu10j2ilI6mPVcnNjmSqt+jZ
	WuZL+FYmW6k4SCZ4y/KKe1zM7e2BOOOa9YxgednNd6LfYJqMnfcl+Da9xPfHOmeIaVns+
X-Received: by 2002:a05:701a:c905:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1b556911949mr1923872c88.30.1795164544267;
        Fri, 20 Nov 2026 00:49:04 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4843652c88.0.2026.11.20.00.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:49:03 -0800 (PST)
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
Date: Fri, 20 Nov 2026 09:49:01 +0100
Message-Id: <DMZWPXB8Y2G3.2G4BS7LSQNYP6@gmail.com>
Cc: "Jeff Johnson" <jjohnson@kernel.org>, "Filippo Falezza"
 <effeffe99@gmail.com>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
 <CAFEp6-3PWumihQLg0CPR+U40sEUkEwU1EL7mgq8rnnmA4veSeg@mail.gmail.com>
 <DMTDV3EMV9WV.TFY5VECJNNR4@gmail.com>
 <CAFEp6-2a-0NSmSZXOdKNfB+C+2T6=hmaBC2zV-sfkCrDwZu0GA@mail.gmail.com>
 <DMWL0GJF8W4F.LOVVKMQHF9R@gmail.com>
 <CAFEp6-0Bh2DtKsqGPpAoMarWh97nH-TE8SkQDGtSYydPf5=Agw@mail.gmail.com>
 <c1a6694e-9be8-46d5-8cf0-d70f8757bd05@oss.qualcomm.com>
In-Reply-To: <c1a6694e-9be8-46d5-8cf0-d70f8757bd05@oss.qualcomm.com>

On Fri Nov 20, 2026 at 2:39 AM CET, Jeff Johnson wrote:
>
> Since the original was already sent up to Linus via the normal -rc proces=
s, I
> submitted a revert that is making its way up (already in the wireless tre=
e).
> So a new implementation should be on top of the revert.
>
> /jeff

Thanks for the heads up. I'll get to it as soon as I can.
