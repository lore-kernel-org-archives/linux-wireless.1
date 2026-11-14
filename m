Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690314;
	b=I0A3cFvdZlqC5k0layIFCeH+PbTJmesYTaRJdAmSeFbmnbVocuZ2eK1kkDBqAy+jL7/s
	 eIojXhsWbGNyALEWZJ/1yvZSFMq38XQn8YvTrgFY3OxIwz1WKSGBc/mDBwqM2medDb9jd
	 0BnZtoqr9e6qNg1n/4Rztc6GZC8n/6Hdhd6LYzxp7SlNZ4Fp0OEgWo6CszpgUpSQ2oX5a
	 LMpCgyjm/vIiDije7n61STOCBTx2cQ/IKrOE/43pfkz7CvSNM4iUtckR/5vFbujCMb9Iw
	 /ylslGCtSbQo+hQ9Cug8oN6g/mQqiaQBytK6LUw8XanIi1tq8clWOp+tS6aVB/Ccd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
	b=gEogWCKWjcMAutqUuD8yzjv5899sn1pw5lv4SMie9dv3Ak/adOrSqCaTnZUKG0n32vqR
	 mTtxCO/JkfsKjd3AHPXF8PYQ1iKF2Tw8KpxL9qJi51YR4FCJCtDQpcMknW7CGfn+Ft/5h
	 //R8Q75rqyBiwSOCifYaesOBUFRBxDw+yv26Hxx7Fj1BEiRDRoGyCOtjnwD9ryxZqwg80
	 LGKwdMxiP8kBcp8yXVVFF4TbHqFb7kLjYCcrpaZVg3kCxzNhARM5VD8XLuUDyVxoov9fk
	 KM3Q8JSyXfyvfDrGXEg/f08MZThyxOQ14cOJu9lAIp/WRxzEyL4Rp81PHuza6SND1Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=WutE3Hvf;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2B8606A331
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 21:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2B8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=WutE3Hvf
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3453633a12.1
        for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 13:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690312; x=1795295112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
        b=WutE3Hvf+o5KpeEuekDBq1HgfX3m2w2ietqiBPYwTUpIweNZUp2baxaqY4m+UW2m5d
         nISJ3A3qnYC51aqskKTW6KH8msJWHqWdYyMyOfaU4ZNLk0PO0J+oNIQNR0zjGlegciqe
         BHTRluu/078htYySVPXg806BRDyd2eRoR0TPaCUBuea7yr3JXLExCNB8D6KOB2oSV7Z7
         h5RC1q8Dst3dBtxmKv1AL3M6t01Si8Zunsfvve1jlltu9/3GxAPRbiC7jMCR2J/fku40
         RQbTDCsHWn1CN7MLHj5OApYc4VSWjZO4jTAZ89dHCtGaOZlFb5eNrP/CCgIrH3IWCoMl
         CL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690312; x=1795295112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
        b=E+cZO3TOz9fYIht/evLI+EPXQOjxwP0MdokSp7DpeYLrl7Zoq2sM2AY+fuGaL33UzA
         N4CdpH3lm42wCUei8GkajVdf8LMmXLI2wVp4MgLGMb7rRs4Ilpu+SFa1JraMbX6NnZXP
         WqKqpeVRpfnwrcgM+hKJW+MpbO34dE3zBx/25JG/KMtes0lLnuahb2zTQZ0VB3HK9t5K
         LRhYrgrM4Gh2jDQsABfLPE26OHmSohU9eCQFAxlYZ3RWyY1nS0hGDk3Fy5UKQGlS2B3j
         P3bDOLgelxLOjROepUp2C21Kjap0E5teweZV+ImZCoFbh/G8VWU1dq0ZAsJcSd2ilTy1
         VSlg==
X-Forwarded-Encrypted: i=1; AL+hErE9IhE63l7UG+btH61Z5dyNK2AvLjs3nQNZndCgLCttB3cYK0t4Umz7Xe9F5qwvqV8GyBR5266uqSgK0QZPww==@vger.kernel.org
X-Gm-Message-State: APuU4Z948jC2L68naqQEDb2x5JU5yTYRua+Js2hvkfnLQK15aVQKiZbC
	yEP+EhbLA1L6CGCYIIUoWJGOUmq0Lttu3PyWj38T3tA/QD3g491U34PielvzMxO1KQ==
X-Gm-Gg: AYBFou1IrIOhlySzBkTIHHhP5poGRGR9/bea6v9SkyMhIYbUPDsrJgL1AMBQTr/J2yL
	6THJ/FvW0xM3yav6kdRRBsIYUHMDn7Tp9BqYvni6Lh1fBi5X9NNWWfke6WIsgX+Z2dFZRphlO1W
	TW6i8mU52plqJy1CKRwD2Wznzf89a/vQIN0YAG0yd7NUL1t6RFkHVJIx9CB2V2qv2YMNeBSQRQ8
	o02kqQyrd/aZ9Otp6ovv+lskltOM4QcgKEGPtuI3b7kzNQeOYZ2xDGDWytgujkDMiG9HHpGloAY
	PgCDMDm6gNKKOBJVJZdrE+sfSnHnHdGDumSySjJWmXBmjNkwDY6tA2ENqLzHQ1+YTMlEgOMnyNO
	ZGe2O6smg3+aJGvQ01Yat+7Cv9M+HYqlNyRRNAUcpv1oC0wm18aBBaZo7GUd2Wsoeoe0RopsLVI
	+v1f7yGa/o+7O1xXCaE9ujtxCNh2EwMiPE5EOove97Jwz/5QOOSp+8x6S/Lm9/PsA9TNqVJhZxp
	sKyN1pdjtvJrD6yudwPY+cAYHO0UXTPDJ8cWSa5NSvs6GAWitrDa2Yv2khZdvSB3gqgJI9opwkw
	tCc+UvZ2OHJnf6Fh5uCijZpOHX2eTU+bCx0m5m/6rWl24vGY6vb/Ll5dKXOk7ZJ0M8OA9aot4cy
	LTRDGMSbjEL3r6xNXCWF4wa7UwUhK+DJhZe7m9dipuP//foWlcs/x57Rf/mVj+I9vEujX4moGA3
	1v0QrhYdcMe6tyEeLvN+F8h/eVqq+rDemaZiammOJsGGHGFi9czOB3XCPqVp4OmyCsSKc8eri0h
	nWxbOgLKi9bF5u19Tw2/MIGr7QidQIFsR9atwA/dnruDm3EbDMWSUlF3v8eWXcO5ijkqlaJ+cqu
	hbnLrfjQfIsNH2GMe46QwuCb
X-Received: by 2002:a05:6402:448:b0:6b7:1b3b:d309 with SMTP id 4fb4d7f45d1cf-6b7c0c75058mr3870449a12.33.1794690311837;
        Sat, 14 Nov 2026 13:05:11 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c7c21sm2604649a12.19.2026.11.14.13.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:10 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 14 Nov 2026 22:05:06 +0100
Message-ID: <20261114210506.787342-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 1:13 PM Loic Poulain wrote:
> > -		ret = pci_enable_msi(ar_pci->pdev);
> > -		if (ret == 0)
> > +		ret = pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_MAX + 1,
> > +					    PCI_IRQ_MSI);
>
> Why not simply using pci_alloc_irq_vectors_affinity()?

irq_calc_affinity_vectors() sizes the block by the possible CPUs: 5
vectors on the 4-CPU IPQ8074 with the firmware vector as pre_vector.
msi_setup_msi_desc() rounds that up and enables 8 in the device, so the
HTT copy engine's vector 6 has no handler: 226 interrupts in 14 s (one
run) against 36891-37590 with the hints (three runs). A calc_sets
callback allocates all 8, but group_cpus_evenly() makes at most one
group per CPU and the rest get irq_default_affinity. v2 takes the whole
block or one vector, and keeps the hints.

Julius
