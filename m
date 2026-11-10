Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270083;
	b=kFog8U8QCrGib+Jw1Qwt4kCdtkxnLIhaVPRF2QkMNj7pNb/uWnBzSA2zkdGt2WFXTfOe
	 kg/ACKZ9x5VUxdUFyljrFNHi/6PHN5A89kF26U7hKP1rmRAKwpXTlGDuVXcfRc7GpQdQq
	 RI0r5yyFnH2LAlHe3edumfsTYSDyZ+EGdvwODy2g1u0YbjHLfLkkcvxrJ3x7cEHznqL+t
	 VEqhsT+4FUSzsvV1qoJHYAOylXzPm8aPvOup84UIHi0c1c5PyNzaEmPp3GjEBLnciGDDO
	 3pYy75FPAB8IPtvhbjBjLUNaqbrvFI6/q3Ya6/rCZV2Gl2st1H2x5bjRxA6w2A2gt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
	b=iM1ly5pRfz0NqUHxWHPehWdd2EkZm/1EPp1pe4Uhz2ij1bHMhUk1QOBYlcMJeQoxbCwB
	 A/KVMrbxGI3U0X026Y7HDhhd71TucS6EnmAf9Cko6IH9t+s/v5qNu/by9FWdfitRDapfu
	 yyDM9VXh1rJm2uPLIvU1aOQA2s0TgBTo4F0lc3aEX/bdhSR9AnX1DqFX/n+rVATAbqBbT
	 4ogPKJ0FpIW1k8nIa0IO8ILDTffrEWjeNWYRunhftvuPQaEHtZ3GRZYWwOW/T8/eff3m9
	 cVazy9LJoNCOqS4m3GEJHi3KfpO55lXgzmtKa/t6uM5ExcdqqPN/jedvS6Blfg0wW4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiUfxT9k;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE0606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 00:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13FE0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiUfxT9k
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4919a880834so918421f8f.0
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 16:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270081; x=1794874881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
        b=UiUfxT9kBW+iTJDzeVM8ptaT1sYqjZVGvEcPiZWBcXfMOHDQqFslE9tqGP6x2uSAx0
         R7yOCVB7tnWM0R+A9UEr/r3i4SWXe/ex7ckM3ec34wAQYy9C2csujB5N5h5O9HUE7VR2
         D7sazpMbiNp9KnTi4850QBHag6ARBKPmVoU2jT87jIEcYasinuCY5ozJfKnLg1ITxnxL
         v62oKGQTE5TwDZOONzux5te5oCnfc32pJ2Wk3N35KfEY2BalpnoWwevJu1zErIbB0qdV
         inxEFOQejYR37iBwvnLXawvDV8D1KOgL2sLgzS81ZCUlYf0UjPZMQZ/KgId1e5B7u44A
         +eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270081; x=1794874881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
        b=dRxIj+8ugXSiQn0DsDMIBYJ9r5fw6tuIzDaCCS9/FMSgloPhjGw8kf46UYhhr2wDLA
         dQy+ZlHmH2nOZIybVVnx6L07Neyi2LI2VRa8Ig8o1BVMprf6lPp6KC8odvaxPdNU8UEO
         UEdLV1LHNDhiuNaNaI9dc4x1OZw9aNWE7Nj/f9H5kQHh9+dUNr7h6M1s3/nVcs7YO3En
         vr+QeKQqwpqm6ybE6YoBnSnPg/PBDSpMxrvxTy9OMjzVoBMUVcdLdp0yCFaMKfAUk9tv
         srzx4RF3fXw9QDfrF4m8VrW3oeJgue0HUTpvVs2Eqhul2SwimoopZdJiDN9JIqHqcZne
         pY9Q==
X-Gm-Message-State: APuU4Z/rCGcCqMrD6vDJLFWM0cqXI0XyBDh+kZqUCucQ4v3BNL1sut8N
	9tondyVAiJH20uenzirsUGYpCQnrR5iwb+L3cCo9WeZ2uS7UIjJpbcsq
X-Gm-Gg: AYBFou31XgksNamBx5XvoNMqyiZ0pnOImrXEa8YCCvpVHKquMc1zFRAjXEizoFFn7VS
	kPRntbOqmL/pX8IE9609l5kWEXik2VbsnyT+++oWoLhrviYxvl7leemAmrztKi8Xvf4u3s25ZWK
	Ng0F0TUX9K7IJstEVNjibBSDsFddijx6/wxF9xU3eoBzUflDtVWksBdhoYHgojKuoprQiqdZaf0
	+yd4Wwru+bpTplpytaK3uYI7ADiHOSOVOeft18ccN0IMJ7LjTm9lWgFXacCAaMMYdUYFN7hZfO4
	nOD8hcBf3bYv4c9DSL+YHqF7CR0uNv1rP5Dsttq28s6zkn1nNiqbUSkNoyuXw89rQljYZrVtOuD
	96f6vo1AdHl8UScbxwadCqB+UnTwhho0wzvjL2xUiQSD4tU8NaRneSe71CLDJVe5FSehOFcWRe6
	8dMDGvlhZFyd4/9Qj9tDw7Dgo0HImnExRP93I6uCAmp+1LNqT/5dKZJYRL47cOgKaZIsOywrL7Y
	aLn8vPUXy2Y+QMisUfBgcaHQ4IKP0QURQMTaF6EQgLYXc+oungqRT2gUfiMIwKHOYfWAQP1eP7C
	qRffOWqBYc08/9q74N1CBUIsEI1w1EKIhmk/179nHIdHcLvAoRJXZSbvmcfthNjQIQPn3LN6eUT
	3So3mPXRiztBzRPodw4EI1bXFwgOu8kOZKGELRyymfE6sFvvP32cwlZPLEapmEsXi58XmMiJNq/
	MG2qZXMIvHHY48F5TSAmSamC21SLMDmhSOcDlYpfKHCdg/vw==
X-Received: by 2002:adf:e001:0:10b0:48d:ee0d:8b3d with SMTP id ffacd0b85a97d-4982f594b83mr1089641f8f.28.1794270081225;
        Mon, 09 Nov 2026 16:21:21 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm1665099f8f.6.2026.11.09.16.21.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:20 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: report no AFC memory region to firmware
Date: Tue, 10 Nov 2026 01:21:07 +0100
Message-ID: <20261110002108.89933-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
References: <20261102200235.48973-1-gsustek@gmail.com> <20261102200235.48973-2-gsustek@gmail.com> <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
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

On 11/3/2026 6:17 AM, Rameshkumar Sundaram wrote:
> What do you mean by "bus address" here? Do you mean the DMA address
> provided in chunk->paddr?

Yes, the DMA address in chunk->paddr. v3 says that.

> Also, the paragraph below makes it sound like without this change the
> firmware doesn't send the memory ready indication and the radios don't
> come up, which isn't the case. There is no visible functional issue
> being fixed here. Please update the commit message to precisely describe
> what changes with this patch.

Agreed, there is none. v3 states that the firmware comes up with or
without the change, and describes only what changes in the response:
size 0 instead of the requested size for a segment the host does not
provide.

> I'd rather move chunk->size = 0 to the default: case. That way, all
> unsupported memory region types are consistently reported with size 0.

Done in v3: one line in the default case, no AFC case and no new enum
value. I also restored the existing warning. v2 had moved it to debug
level, which hides a request the driver does not implement; that was
wrong.

Thanks for the review.

Goran
