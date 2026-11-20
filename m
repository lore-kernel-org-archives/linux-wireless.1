Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194151;
	b=gXYJnnFENhZ1sLvdi6sp8FkSdpGMlwUtqRSlgAW5+xEsn1JX2bp3sjsr2yYViHNT6dWi
	 WbJNoUXUCH9gqp2r+mirVEtNVJ19MdK65vSa76jAWbgi692gR+shiJ1Nn7lIoKMdTqrfi
	 QOm0CE53ScPM+N6VH6Td+QIFTU4C0K8ckEDefdbNcw2SFBdvPwd2Fkg1Hs0hTaMdZP9yP
	 FNTRP2rIxDSCutWf18IX/M395Ssa04xxfh3S0vWAzgww8MX2cx90XexP/r++ess4ZcEfr
	 lD1uZVYznT2PE9Nb5QQjxZh2qkvqq8tfyTEsYzluuh0AM3HC2NZFGi9ZLlGJp5i6Mpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FwHWB7P/0a48tdW8YS81QQbTMddEmiTEmcYnkEG+2ME=;
	b=NCge4jmeE3i1Nlh9FBNfBQlD1aBReTgCXk/4Pkbf+S8fkC2ZVjWaPwlkFMIgUB698imD
	 Z6tFn987EM5i8mulNmm4Js3FXCsFNHb4LrkxsJP3gLBgh2XHBVdewsBJK7HcHevqRg7Ft
	 vsAM7YZzO4NRwioYQauxkg9RZ+xemkyRseri+zJYoH/poRWTAIvpYuKlET0Qh0rpnGo+9
	 ZopYoLLR5TnjZFVd/W8AS0McHmSjN1IY3dTQHU1K9iUcS8xnd/6cJft7c0fJ5/mMvyp0F
	 1amy1vXFs0jjbyzq5fplPePDxTp5ooKjid2WrEfzELFD8kpQlmAN1iH4IEmpv9zIrYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfRrAI1A;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CA606A331
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58CA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfRrAI1A
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so627783f8f.0
        for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194149; x=1795798949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwHWB7P/0a48tdW8YS81QQbTMddEmiTEmcYnkEG+2ME=;
        b=IfRrAI1AQYFkLLWMV8ai/rArqH7I/ixvzrZzMvEwCpURX6/6N1D3pn6GtG2Btg6EMk
         7Pw2bz8YwAPrJEIrBXf7hM/A2TedeSTD3A9TWu3AVUl/ggHgFCnqXsxA1kB8O9pxOTNw
         TF0Kt0jVQ1e6mdFPUctZwyGljc2G4pDgzVOTIo7wwjkNCVEOY6EB6rFpp0J7a9UvSuF7
         vb6v49NTEplRccRjGRjWFlyXyhWsOS4TQPwLS/NecXGcviIyzkfREtR8EyW4Uw+n11sH
         YXQp1cHtFFYtXQzhbqR+COBJ3B+ojfvSokQivu+WWgxEwmbjW/ARhgdETe0slgvzPIiF
         tgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194149; x=1795798949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwHWB7P/0a48tdW8YS81QQbTMddEmiTEmcYnkEG+2ME=;
        b=DrkAcx0A9HtHWA1Gt3zsxpI05a77t05SLfoBq2/agHqaKBf3B+1jaOaxurLdDrvGWV
         zKTBAfRspAE1C95tnnNEb8a1bBBk+U9tRow25lDs4dSHyApdXC2rSdI3yPxTS+p7R5YW
         hK4fXO2i9uCLVXuIuFo47geHJCG8MDGl0Bo9skmO0sP3+1l9hcoXmGu8URsivPLLk7cK
         W1xAw07T05Th772boxJJyav4M+ArPxw34R0cJ2Rh+0tWcgqcPP9KeeqTaCehRFNeuro0
         mAJjc9Y4iISeHsFbOg73I8HmXwp8U/01yrqf99ICtqoC6nSoL357Mdn+1mMb9XyMyQfB
         Oqww==
X-Forwarded-Encrypted: i=1; AL+hErGphNJLaM1uTDAl0ThtQ/qQHASU2IsrnJ+mE+9oKWMlkup2IbNR8eDmhhPa3crasbYTOwmkinGSXAOIAD1gvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Na9QGM37QLLvtCSvE8WGvNnkheEQQI7LSfLjon/A6B1KHHmiJ
	wYPa8lxt10xUKpy9poZyG0RqnGUl6lLlh7ZvxiB//X/ezwweL4v4LrDErXzRFxnF
X-Gm-Gg: AYBFou2PzIZmPyBP9luVsDcrIFbLwiVlJ+kW0DpUSQo/HwW1p3ZJas0Yt91u9b+54mz
	rq+pHnWEqGTkwZTrG7RGTv9dNHmtc7uDgLVcHZfut6rwuFqgKO7EStsqUaLdkoLm+FQwNyIB5uB
	5ikOplgcCPKAq172rABl+z53KIVi7t+VD2o9vKbYJwsJ90pqluUJAnu6oPZg8zpxk4tlDgeuH35
	MH40dl8RW/KK1Vl0S9W8P5rg84TTN7DyQAgwLpZHE295GQgU1+FDe2yWRqOoD3OKlRt2bmnsC0w
	cH6WqBcnNnCvzslw43pK3k3XpY56Y3Yyz3gq7JksPShdjguVa3sBX+2az+JOkyAW5gmZLJPHwTU
	kDedJoL4er6A80N25nfwE3jfcJandXbh7FC09NopFvBJXzgzVcUkpzN563UlScNUsWsxpXDsCOr
	ack47FPZJRyZ8fS8pK7w97kDpOaDmLKV7kY9Nk6MJG0M0YnxDYnHZqYjuzJEI8q8EaI22r9czQf
	/8a3nNaykwGdFHZG9XipoVq3fVDZxsj6ZzN4/IWRbOw+3ICZHixkJIeE/0Tb/h3iv2u5n/KMDyR
	rXCQsJUirjXL2Yt1a4sn/X7OWIv2uBVYiAk=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr87073955e9.25.1795194149145;
        Fri, 20 Nov 2026 09:02:29 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm6345804f8f.38.2026.11.20.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:02:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 2/5] wifi: rtw88: report the frames purged from the TX report queue
Date: Fri, 20 Nov 2026 18:02:27 +0100
Message-ID: <20261120170227.374774-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120131000.33858-2-luka.gejak@linux.dev>
References: 
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

Hi Luka,

> Could we clear the TX status in rtw_tx_report_enqueue() before saving
> the sequence number?

Yes. With a test build that drops the firmware reports, a purged QoS
null frame reached mac80211 with status.flags 0xff and link ID 15 on
arm64, and userspace got a probe client event without ACK. v4 clears
the status there. Since the patch changes, I will drop your
Reviewed-by from it.

Mehmet
