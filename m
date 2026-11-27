Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788844;
	b=5Vndtak5OwFvAIp7TkyttbRg1oQCWC3jHDB5uA/IHSPNoBjyElJ2N1hwL8SNXvNXCGEj
	 kkp1wCXB4/DRx+IoDhN+5Pds59wn1Dw8oVMjw2u+vDcw4LfWKkFHaT5Nz3kcCTBhIoBES
	 ZY6sEu1V5NNvJJKE9Z8T6cuo+84gdOtbN+GzWmHWmlYWzRCYp6gwViUK8uDmp/r2H+pO8
	 J59diBIWQgCyN0Ds79PoPV+/afHTyYHj9WbhppdayCq16Dif7903mgosHxsfJervqo8Ga
	 Y12mHRJqwvpDJaS/inC849TFoaw7JcggYFQMCRQp2OOyJaj8B12FBgloRKtMLAeQw9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4BWGfKuysLwJSXZLulJ87yZmWj/glvghmwYmsfRkDVY=;
	b=lbpquIFwlnLjwPb8blPjvOD6Ubhs0/R+SrlI9kbnRQZIdEyxeTGpuIgge1M0NKDJMLdR
	 FRZJFVTFeEJlMCqfvGfDhbmbKdYSLAZTbjuWpRgiaeoNsKCvTckanpEKziD3okyQ9iYhy
	 44e8yfP2NTFsaAx3/sMkzo8M7ijErzd0yDaCi53tP4XELBF4rUOqt5/ElEaeK6qwqdI3e
	 beSg1wv5RfOdPanKFjz8zq5UU8XZumcj22F18RuchtBWzf3IOgNATE/f7hm4b0lc2PMen
	 fDHabW4TkvNmHqjJ00rBysSqffsFQ94wIZcfmfNgbKrTsFIfzRequUjv4QgFboZBJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMheY636;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA09606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMheY636
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4680969f8f.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795788843; x=1796393643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BWGfKuysLwJSXZLulJ87yZmWj/glvghmwYmsfRkDVY=;
        b=fMheY636nIIJKKzv5AvXhyxzHm9YhTBTwcLZsH5sMYrI7j+a2Namr5FlsDfVgke19f
         iIMiclh220spaQWAHqaUMEXRmp14elucEmcO8HQjujQEnBxLyNT1AOnf/ppyZgO98nq/
         MiRPYAVDvcdNdhzKg+IKlNRDrhnuOhwLIAIat+Yu2LULSLmiqPLoCSjX4pvNG6Vif2DE
         nIZWi0VMCosAGl1F/IGsIR/eoaLWoGO6gNANeIgMl9Yr9ncyLPG8BsPCTsK+iGikyWYP
         vO5RQcbIWDu/DGzicnCp/rDx0doX0RuWyO+7q597TpabrBeMfc72lwTfvrjpg+Zfp1E7
         wYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788843; x=1796393643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BWGfKuysLwJSXZLulJ87yZmWj/glvghmwYmsfRkDVY=;
        b=cbsuchytQcmYk3LBV1DvhpTmhzGMXJS6ol2KBynv4mtg+SAAB5zKCoELr6I/Inw5kc
         ut6qHhiatdOCXSu+wIjXNqtW1/ISNWPDM7ufEdowaFv3d73KZ0wJCtNCsYzL5Gak+7kz
         S+cJD+zH+LDnistsGShQcKDYMkft85ZQS0wsge5b35IU0SJJk1ThWnMGdtQfw8xSRABs
         P1QPNBHU89zHxnyf/euWSaDl+nE1cT3rkQ19Mzha4vQdPyX29RN+byzcgWK8h7LM3pyI
         UWGohbAf1eJ41o8nwjBFtXtEUCRKRPhaIuB4AiXnGPDraAc1JVlOG5JRGw4lKtH56RRt
         aBYg==
X-Forwarded-Encrypted: i=1; AL+hErFxV7WU0ns/Kh45n7x8vHX71mAhagXv0P87EA/bawIuPwiomGC1n0lWpWeYCtOzbck1hBL3Xzwt+VI9zhmQyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xNxxg5zY+7sfnelXv/r9hAvS0K+e4hD1tsxILtotll8DTE6S8
	JAAynEZhLXKJ9Xu2oLwEZ18OmsC2wDfvGH01s1RiQs/ZSwGj2GOhWcT8RSBctg==
X-Gm-Gg: AZFdTZcPSTlddDYnSMFOyCN/5a0vqe3WYDmb+qGlzK4JNim9hhea7tqB4mrC2PoSd7h
	lmIpQAN6a4xVH5IyFXloF/BI+UNN1hG33hJHrQ4bHOOjfNYeYEmIICtQlllpAm7Ra5ijYZZ1uAG
	Nbq/bi5EJF/xsjhxg728xkebn3iQn/jQZr+fs5zRW6mfr06dpgL401SQnM6IjcvFtvVRym0kNlc
	zBBd/FYrlaqpPAT11bylq7Au1B0s/z5NsFHwhRjIETdrVzevun3RksIARYFPBXmJhPLpXm7rj5W
	c1hIYTf84HrMVOGvDFjzqGDxZjDHb+NY2gKUL1U87B97k9tuOXFmP8l0Ld7pcvvQ5yhfcijS7r6
	DdgjhfcYu9VLJEcgrzlPvIbO966X9ugCEDXJwozPeqowY52UM2UYUvODZzYk1Ji0aEZhopNDV/v
	dFfvnsUV1yHvxMQYdgX5gR6U4UXUren5SG+Av2EYHISMPXDepIvIOvVr9uFLb0+XjZOiq7+iqlm
	r43oasYp38c2Ynrk6acciNfallS7oaRgtkmnTk9A/S2aD+TSXbUgr9R2CimZG3q1byNHUq+Xkwb
	AwvRWTibid82YEky6vIasati6udqdXUe2Rk=
X-Received: by 2002:a05:6000:454f:b0:4a6:d298:832a with SMTP id ffacd0b85a97d-4abb31ade9cmr29618487f8f.30.1795788842509;
        Fri, 27 Nov 2026 06:14:02 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm47588546f8f.42.2026.11.27.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:14:02 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v14 2/3] wifi: rtw88: support channel switch in AP mode
Date: Fri, 27 Nov 2026 15:14:01 +0100
Message-ID: <20261127141401.1872285-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <84030084b4f24c4199a85cf05fae10b0@realtek.com>
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

Hi Ping-Ke,

> Have you actually tested WoWLAN with AP mode operating CSA?
> If not, I prefer not resuming CSA.

No. With an AP alone the WoWLAN suspend failed and cfg80211 stopped the
AP, and with an AP next to a station on USB the resume path never ran.
v15 drops the restart after resume and only stops the countdown on
suspend.

> Create a struct to hold these CSA data?

Will do in v15: struct rtw_csa in struct rtw_dev.

Mehmet
