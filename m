Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045699;
	b=p293w2NlBQUJqcSfKPBEe+CLgYvrqRZnW684OI9u7I0HYptVqN9baRp24Qx6UOwC5hQq
	 v+xb+OHkmv7on+KW5PYbyYnkBukegWT6aQShGaEMxhUJ4CzlIbBs366F+TRVhQ9xuBQyI
	 V7VuknOenoSFnhT0QQeCxJMMKeoHFhiDVWWkrjj5NwC33Qb7kNAiZ+DwdaAiIWM3/CWSe
	 XAIlfeX1oAzYd5jTtnERhrsGf0ySAYCRMSRtCQjSWliUx42iKkLDU4PEqhMKLJt/BhgKc
	 kjOiYYFVpfjJ345uAQ0gzVct7RKR/KlKogaG3gPUPYo1Uv44qzFm9Yr5U05GMCgmnzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
	b=DpIIdCS5GejlbSZvtbcoXjsCGNt0rBQerB/Ya+p7G3JRP1eMaXJ3kU9N/l7CEZmG2wL6
	 X5eOrvKLOEzwWoX0rSoe3OrbkyZg259mocO8jTX5Av+JpMjwSv5/fNr30QluqlSpuIt3G
	 hFxXVZr6VCWZj/4V3Xsb7vbTa9pRQBnyqf9M70gBNHHyk1TlFWXCA2M7pzt8pq3wAaBQW
	 nCnmD9fmMXU5etE/CpaO4CaYxOctzCsaTXz8BgQlLj/WX8qwssqGPZ5ZczwejSaTU/r3I
	 /f+c5vqQrGFJ2dNglOebUdKXqxInAZcYrfz42Wb7EBR2aiuedcc+dWa58DtGvixOB8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYBkx8us;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84612606A330
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 23:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84612606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qYBkx8us
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2467948eec.0
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045699; cv=none;
        d=google.com; s=arc-20260327;
        b=dvKAf4qZwnV1e4clgpm0YMSZwYo6Pe+SBro0Znn9CWJkx50tJWSbkJIA/n8QJGtzrs
         p0HwUfMNvWfLDVQhAR4iMumSeQqvvnRjpO6iTvKZTPLCwmMlqbb8UYURCuvyiFpGw/Jb
         mUC+XC76GTJNNDqC+m5pEZRfwFEOFAuNeTImpSNQm0LkLF/OisTLatlMg2dc2/bVLWfR
         EVcabO/eFZd8MoVeBl3HkUAf0D1vjHrtS8Z+KFXN7kv/Df+UoDkgr9gEqcpWoX9vLGSC
         7H2Yr+jDritGgMQgG2yJ8QSFrpAYBecY7wuakxJwCjHQRmcRb9+GTjmm11colTJyr+IC
         X5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        fh=VI2SguVvahl/iLOoxkmeOwuX/uCXnqo41TPqGZlPCj4=;
        b=fOlISJ713nj1VJHf2gMZiyy2rbE8804xDAwW1/ONFiISGlMS3bXJTaO1DeypKa7yYz
         4wD42cZBm9YyRqCiM0lG4hjG2T11fjMkAvGJsj6Vq27uYP3mjbK1fT6aNPLFrAfP2hN8
         yy+gXgfi4oZj3eRiBLsTDu1S56sGTUgD3wahvJOCoYS3TGUDG2yXDB1j3zSOE9RDFIJn
         5CPtmu4c59ngR7EwRpjqarkb8OUx41o81JFpm89c2j8NN1P2ThVM/jFXuEombfSjpHqT
         +Jgelci1zetZWs60pnnOHMfJuOl9PXOp5na1YfNx0MN7TbZ1ZXLjVJ9IxXQQvQJfYrFk
         jCjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045699; x=1795650499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        b=qYBkx8usCC08AHPWPC4qIYdkng3T2Gg1i9lu7IDjzAA+ByGAjaeQeddOHoQBk+6yTM
         b2t4VG0/8OtWiYw1e3z0DBh0UE2hIzg/eCA826Pp10ZZIrUjnX86EeJD7tyQcDhthkwo
         +4OqXT/ZL0d8+iGG1/WYb0j74sKipMw1NnlRZW9pNZ+g8ltMRp2ck5hc30sghpAZt707
         Er42Z+GpUeSQyyXDV3zLf9CyT05UHWfHNQ3/oP6RFCfxceibFKk4uVVWQ7XIbhow7Kvt
         Hz/EV0VJHNZ3Q+leOu6eFyaAUYZpSs0BYeWqhUTcRFjWaD7jaf18sVjCRD/C4weZ1lD8
         rtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045699; x=1795650499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XbA3v0tCDqlnhwaDPt+MfMvUsXTto+/3lQOwBsOTkYU=;
        b=1w0RJlIcmgTIYMtLutLPWvHbaXAL3Gr7YsKORYa5/LE4uBv+GotjmP4A2jXkWCGsCo
         EsLkruO3v7ajC02n3b9STh1wdrr43zfLfret7M0n3kHvJmxq2oaM25YUQIsxuaPum6Q8
         0FZFr/Auxm+rX7FXoQdwlG3n9M1T3VU+enPukHRWKz3SWUnyXX+SYPjqBsTKlRfJF80Z
         Fd1MWbTaeZFIx3p3YAr8K3gL2DgtUUQ1FK6Ygi5V1W1pt5vpd5HjRHo/likmVo6+f30A
         PGHV7MFh1e1SqCEnSHRVQHjUCSY8AT909t9FIcYZ8bAVOH8nZCIzzL/t+gFPj2aQD7z8
         lmfw==
X-Forwarded-Encrypted: i=1; AL+hErEchDvHQ2aApNbF7WI8qmuuLgFbFe2K+KILJi0KnaxoxHJM14X/o0Vs88w/4HyvBS+g5ms6DZ+1d0aO9AQnKQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+r1p6Q5qO+hobxs+P4uVFdvXeFj+C9yEjrT/aI1/kSkxu2AcuP
	WpsEbLuwfTGDTp3CP3IgvTEgApv2C2cRHtguFJS7+dPqrdzS5WbmdpESZ4M5IrPjnElCyIv28r0
	jBstjEtCYfDiN8GTUVVI/le4fOlAgjD4=
X-Gm-Gg: AZFdTZfTt04wCqPr2JG9aqh0d79qASJOyQ7IvXmmwFf3pgJDfw/NZNeWCaXcgYbNT+a
	wyBM8numzBwT3/lr4cyM9AjTlNETq/U/V0lIyHQMFu6WNevyDIbCmz18IiCj6BfijcnJSkkr+b5
	soDmMyL4stQN+jF0ygTHlBH7donE7sMfD8L5OrfAwdbc2ZWwsaXwBBIDr6YcSozJK8X009NLzl7
	AJcVw1Tqt/EaIYNjpa2KbykMZaG1n1OaUO2BPsOaHDJRzbka9WIsSyymVRd+N07w0/ihzWXClY2
	lMHNcdmwxxrf2/6IEeB+dieSCrkwBsF5uouwxsX/rwkDbTmCQA0MmBAgWHcopoguDD/98PfLjKR
	129EPeL5MT09PDncAIYGwnb5nKDDrSe/1iEhoL2VSjOtn6eeQe21tFqkbtop9d61gbjzL6DZXEM
	J0seApp3LMuw4yEuVtxQ==
X-Received: by 2002:a05:7300:d210:b0:380:f8fd:d19c with SMTP id
 5a478bee46e88-3828181369cmr4316220eec.35.1795045698347; Wed, 18 Nov 2026
 15:48:18 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com> <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
 <CAKefsHuNpdkSG4m90qavkXD+80TyuX89gTVR-WhBsWX4m7-3Qg@mail.gmail.com> <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
In-Reply-To: <29634240-17a6-4f61-8cf8-a73e10c8d0f4@oss.qualcomm.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 18 Nov 2026 18:48:07 -0500
X-Gm-Features: Aa3M54rd6z901o4jFDdX9BIXR6e1rb-3tXX1SIFSQ_6Oa5HFj9_O_6QAwqOnrbg
Message-ID: <CAKefsHusjRX+jo4DAywmVTEqn_Ypb5VUBMfZq2VbsEPNSeTq6A@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Wentao Liang <vulab@iscas.ac.cn>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the explanation. I will split this into two patches and
send them.
(I accidentally replied only to one person, sorry for the duplicate.)

Thank you,
Changyul
