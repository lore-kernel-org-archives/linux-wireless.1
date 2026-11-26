Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.108.69.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727574;
	b=j+Y2H5DTZB5Hua2QV2+Gb4cUEz9lAbReqwRPP+O8P+3decDaACRDtvPyDxZ5r8R2/hBA
	 mFEOi74KXsj6nk7iEP9UadBqVIcHZGpCeXfXoQxV06ZXhJhK/4IYkPKfryxKT8U8MT7v7
	 0VO35xwn0vfUzkDPy8RRfNYgMEaDqBb+SQXLgviWFI4afxOuLndFN8VWzXlwzqYsO82Wo
	 N093F/ig6tDye1eJpMsCob/nZGzrw/Na3PCNnFeXww94+cXRV5fByuGtpeVNb2r+UMYGt
	 Cn/3q04HO3xQXEmbZeYeynWCH4nOAqSVBLjB1mJMQrJW7Z3wwt8XKArBTHUDXAVO5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version:X-Last-TLS-Session-Version;
	bh=dOdjYXC4gJgh8OAwxjMAdMyfCpmuQ1aKcQSbsxMDT18=;
	b=zAD2GcriXJo/uL0WAH2GBn3PAyD5K8QidFrxvElDHSTYi344r7MDSJb9OjIzIYjxN4Cl
	 WrX9Nl6C3aqz99ktk6mipzdj+ZxBCFstd4cDMZYm7KmfQn9xizzzJqnDDdWhfR2j8SyuT
	 iNceLBEfUoTG+VcsGBaVoLrrBnKwAWICfQ/mzGTfWU362n/UuwEWrwxmiO4YfHvdPN0us
	 uMMmgdcfPYP/FTT4GuzcuuNKAJhF04ZiGtILn/ebgyOhkZZP9GJjggRCP/BWAtETI6YFQ
	 k0fXEVzVwoLBoW6NAnbw0JaB8YhzwQTXtMjngWJ+BcKMsTs+BLQnxOfAySHDuZo0Kfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ffdus.de;
	spf=pass smtp.mailfrom=ffdus.de;
	dkim=pass header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=badUsc79;
	dkim=pass header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=dF7uKhWN;
	arc=none smtp.remote-ip=65.108.69.237
Received: from mail2.nadeshda.org (mail2.nadeshda.org [65.108.69.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C7606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 21:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ffdus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffdus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=badUsc79;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=dF7uKhWN
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBADE40454;
	Thu, 26 Nov 2026 22:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727564; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dOdjYXC4gJgh8OAwxjMAdMyfCpmuQ1aKcQSbsxMDT18=;
	b=badUsc79cmaSo+E/5O6aCZzhu+5sW6ECTEP0Q7WevX7EcCPnPf8EqOJu0aQjuIrfTNA5dq
	vWDotCoqKUkgYNOuz7WsZJduPQ37N+imnZskQsyPsdvqfiLfFMCfWy4i8e1z1FsYpIbykc
	v+9xRcHqAQopYCAT3TCCocVvWLaxg8Ln20CJZ0sYKtw3LhGu6EL8VGQGKag1UhbM1nKbeg
	Dw0cPL7r1SC7mDlQ7TFSREXAkDzndFZYa/N2xPXqt3660BFiEc+olpO7WIdWoALHKi/XPL
	RqeBhFPLiUW+vB+QAovRDmqKAlYJS578hbxXjqfngoV2c/prLVpsYX9+vRdOGw==
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE6017883B;
	Thu, 26 Nov 2026 22:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727562; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dOdjYXC4gJgh8OAwxjMAdMyfCpmuQ1aKcQSbsxMDT18=;
	b=dF7uKhWN0HRC3Vb01e8G350NJvMiHx+YtdwhmebSmFJrZ6sMaypNdDRLR9H/RsEO6slYtA
	oMD8SCWPZXNgNXSXc4Vl6ZQeGVZqU7uu7Hj5EYtFSVTEobBSkkOSuRpJ2FLnR08v7CuKYF
	C8uV0uYpP/BMAo43g2IVnp3wQwJqMIWoIvqO+YVAKr6GQ1Qg87SxyHZCx0SVC0CP8yG8j4
	EFAIgyv4kYnM+G2qKA7jC5xHti9YcZPpIR1FdDrMyBRIQcFIevRRy4eJQjisTkxg+PjLug
	hWznwKC8uSoOB5am0IJrTD5XGrc/7ffbLg/tw5z/YVg/GU4sOXEtQ/bELQKxGA==
Received: (nullmailer pid 3955927 invoked by uid 1000);
	Thu, 26 Nov 2026 21:12:37 -0000
From: adorfer <ad@ffdus.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath11k: don't send A-MSDUs on mesh interfaces
Date: Thu, 26 Nov 2026 22:12:37 +0100
Message-ID: <20261126211237.3955918-1-ad@ffdus.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122003504.3341873-1-fmaurer@disroot.org>
References: <20261122003504.3341873-1-fmaurer@disroot.org>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3

Tested-by: Andreas Dorfer <ad@ffdus.de>

Tested on 2x Mercusys MR80Xv2 (IPQ5018 + QCN6122, WLAN.HK.2.7.0.1-01744),
backports 6.12.96, open 802.11s mesh. 10 s TCP, mean of 3 runs, 5 GHz,
before -> after:

  ath11k -> MT7986 (MR90X): 70 -> 159 and 35 -> 176 Mbit/s
  ath11k -> ath11k:         97 -> 182 Mbit/s (other direction 188 -> 163)
  ath11k -> MT7981, MT76x2: roughly unchanged (-10 % .. +4 %)
  senders without ath11k (control): unchanged within +-10 %

2.4 GHz to MT7986 about doubled as well. No "failed to disable A-MSDU"
warnings, no firmware crash.
