Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547654;
	b=3k153zyJEN0qNJ7tkwfMWLwoyHfsEJSf6q6mnWwLGrqjXmwHcEeJ/y8b7AC3sbcdonum
	 EFR2QfFqN6gjGLElwpcObREY0OZpTSvnHtTNzv4iOW2jwYdyxcOuW4O7+vwhv/dsMMt2s
	 nS/zegs4augM/e4kVGiH+FzyHBUkcCYMfzg9C6mf9abn9diDNaUK/C5fLY2+Xsdfv1+eV
	 Nk37EvKAA/vYhnBGsS1EQSZKY6Aiv7RtdpFJC+3n1G2pled/dy4JxFj3abv1lis6gQrfc
	 EdexChfZe2s0qlz1+a5k+BU7nKwLvp7W69rPSMic9zQpgnt0qNWSqhEgMWLfBK4c4kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IxgAQ7l2unL63k66568C5pCDtenSdnWni9wrXJ1IJsU=;
	b=0LZGYbRoDLem+RuSal/MCO9/JnlqTKnN+uMs1D2euiCiyWMLGFMTTeYp//f2dXPPwSNi
	 T0r/DthibHG+KsNi/qphWCOKqcVfvPYR7w4zw7M6Y57vwdmNuItd9cNc4tkUhjzzWO6aF
	 BBBP5dIbqtwymdbPG0DZK5mNN7v41SiBJmDZkUEHjo3gectHpOkHeo8yXisfs/kr1xT35
	 vPnj5+5hmD8Q0PyLDjHKWh1f1Wi3nld+2tS0tWfZqD0vSQ0rKJDcNnpp/j8F211Upy7Q8
	 wHugP2TFajNLbfAkuJq3bOSOattGKNyTyRzj/T3pzX+XxPhBQ6RaSz1Re2fyLpeOQ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bJRy9l+i;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB6606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 19:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bJRy9l+i
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a315ed211so5985241eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 11:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795547653; x=1796152453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxgAQ7l2unL63k66568C5pCDtenSdnWni9wrXJ1IJsU=;
        b=bJRy9l+ifqlBZvnnK3syMqfd2PA5rw6Ep5pgJJWiB22iIdzqBPW1FgCKjAXRRVj7ku
         56hLaGwDqmZvT+YljgtOtHIvcBdSZX2e8MhcEP30G/KUez7TefOxcbGCgEyLZvWXjVmr
         994Cz2AwycG/BeQO/sENk6YCAU0/tIpeh3Hw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547653; x=1796152453;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxgAQ7l2unL63k66568C5pCDtenSdnWni9wrXJ1IJsU=;
        b=jzbpZXooQPNdQGSCce+zb+AStaI5ZsgDtgn+Y/YgV9VQimg7i7r1Hd26kJMjEywXP0
         iczRJp95YfDUUZD1JxglnMkS3nQuRNUe38N9xuS1EWwsUTud73K1ucdnINzwqZ/cY2ws
         DTpP1SAVaHPxuA2vjH4BJ8w9BJjdrqXQhESKLZfG5t24S1IiSGuubf+Y8urrIEbZqzrP
         x2TdlQXnIamsenccoHAQVvgvlQ2xXado1z94381SG6vVl3E+x5BR9klMteBaC17QzIno
         s2EZsubxaJhSuwK32Lv44B7jTNoznRRWaUs7A5YRKVs8pPMxWMgjWrBskfJTukz/IMF1
         xVYQ==
X-Forwarded-Encrypted: i=1; AL+hErGD8P34DcfGL3AW9uKi648HlMO9TH8DA79F0klwyefNUgt2Rqtcv4IdPziNpbDFa/o7fWUR2nd3b8k6Or1Vdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CXCH3zYZpa0icsbw7oSaERvTSwCaGeHN0s52Gi+DARsIxA3kA
	rxLJIDLM3NNg6XqW6tPDpuUGFzpg/Zwu5sH3RBsjMVZxi3xJy0fEgCA/6+En0ARL8w==
X-Gm-Gg: AZFdTZfLDM3lFwErfHe8x+ObvOHWI6qCb0zIuG8ySO2oZ2M/eOgMU5aiVj9eS7N+aQQ
	QNyBZhxMmnWL8j8RrLkDaHgW2qiCVteYOy4vJ5PKxCmTYPLvaG0oe3fRV33yw9niBt60Vs968ro
	yGkxqka4kVG25J7/2hUw2ddcd/1U69pYaNHVg2D5Uj68frI6+ySZOMQlXcXo7pXTFFUJUxbDg28
	0vGv3JlrIQxqT4+uUH9mfle5niQi+UhaW/VxBGsmGyALgiU0auqH9BmoTu15wtbvVcx8PH03TXe
	djkSzMVNDpiU29IInyMAUmFUkcyH6xO4bFVaEXQOrJUZCRHK1emWR2ZxZl2S++ts/rULO92xgw2
	jM7qO/q31q+OjZVL1RZOSvet3aotuxjkNfndzIeBziRnZ8IqsYnSVxfkNThOcmoiC0Hg71X2dTz
	JczwS0eJ0Te9kgLgdrxUESRB14QimWUPwhzaXcom2YPmE0+Ty+h42G6Os7SemA5VyqOvOyE36ZS
	T8FldKzFDqlPPBH0Nx5qAQc0LgYr0gEdbMngEZgWy7u5dESNUw2ziRIKqzGRcskE15az9C9TKxk
	Q3EyB8quLMn3qWW8YwpUDBzvs/lOgNwO4LmRlH/CyL2klmaxghknBm3aljOnGBvRsZt8
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr17384863eec.8.1795547653055;
        Tue, 24 Nov 2026 11:14:13 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38566cd4efesm48805462eec.12.2026.11.24.11.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:14:12 -0800 (PST)
Date: Tue, 24 Nov 2026 11:14:10 -0800
From: Brian Norris <briannorris@chromium.org>
To: Tristan Madani <tristmd@gmail.com>
Cc: Tristan Madani <tristan@talencesecurity.com>,
	linux-wireless@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: Re: [PATCH v2 wireless 0/3] wifi: mwifiex: fix three
 firmware-triggered validation issues
Message-ID: <awXiAu5V0QIICHoc@google.com>
References: <20261124174620.1572200-1-tristmd@gmail.com>
 <awXQpeeRwME1kVFs@google.com>
 <6b05e143.d1b7c3f5.1f3f2b.3fa3@mx.google.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b05e143.d1b7c3f5.1f3f2b.3fa3@mx.google.com>

Please reply-all. And especially don't exclude the mailing list. Fixing
that for you.

On Tue, Nov 24, 2026 at 08:10:58PM +0100, Tristan Madani wrote:
> On Tue, Nov 24, 2026 at 10:00:05 AM -0800, Brian Norris wrote:
> > Please include information about how you're testing these. (You're
> > testing this, right?)
> 
> These are hardening patches for firmware-provided fields found by
> code inspection. Direct runtime testing would require injecting
> crafted firmware responses, which is not practical without a device
> emulator or modified firmware.

Testing is not only for the purpose of triggering your alleged security
issues. It's for ensuring you don't regress real users.

If you can't be bothered to test, we can't be bothered to take your
"fixes".

Brian
