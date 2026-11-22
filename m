Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378181;
	b=cZDFqdVb1B9xsqP5lXUI2h3aL3MDnR0r/3acn5UxRM5H3gIChgeU4c1WGPLFte86lhyw
	 7x9rs2gbRDvnocxMCBTwFbv/vLf24/0mdN+/IjEJIkAukLoIyu5P/MyZfdZ+rpHgiApvM
	 OR7PbwRR0OKtZr+cd4r5TMZ+jKItvfM6Pbd3nJSb+8EsstM0gcaV7po3jvJyn+/AWLCbS
	 tfzy3CEer4HOVhJNMA4QgGfv41yPw2se4e9bdKdvrAJfnvm3tjWLAPqmdyqcQjNN1Gdgh
	 NECyWWVDsuyg3+MquBJ6D+cqiZ4ewFef/ntjEjgOU0koPd0EDb6X2ziK6kv6AcXaVKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378181;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
	b=nfx2LkREE37u5TAPLH2Q5mNtvzwajdiiZS7DqHgwi4qh36qaZIp0D9Igp2OKROv6VhNX
	 c80c+angsNmrdtoUW92m0P87+MmuD1VNdAvqapW2+Q9TJ/drQJNqInCTxE8otYi54867b
	 +z1kp8MhpdE86N/KhU0cpWWknDTsel0CXlNzanu+D35dCI2MmbMxT6hdleGxPZOZbBCM+
	 bu2MU1PAGUu8czVmVA/fEdj59MsytNzvNM0oZkFHIy2zqwlVgZga5N6TSpXENvHJja8aW
	 tdrsWrM/YeHn77aiYCjVZBK79utcy2cqm4eD9yH1Wvp6G8Cbh5PKPUFw4NnUgnIMCCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U7q16PjP;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA77606A337
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA77606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U7q16PjP
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1808906a12.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378181; x=1795982981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
        b=Q6l3f0e5nIk3UqugnTWM/PWq5KU/wWILZ7D2BxiSjQLJQM/YJmD+Cq8OV5rH8FNcsF
         m8reWt2TAO6QfIBPft3oFBFMtE9SNWn/nusJJbfTYqbeL9ajybGTgJPXiS4lIu0kxJEv
         zAyyM/yZWRf3vJCoEcoKccOZyE2jZ+3ceK5cGLPOugVHih6tAfAupS1+DCUEdSjav2Ti
         9B0IiHUgs7y+MCG8VODuQV7RaQ0yXoS63zHlVDQohT8cf/mFhBaaL5NCdIl7JA8CdQX1
         p/XAwoYPHar6BVSLQ5zw8oVKkhrD2fdlEEMMbbJrJCvmwIpset36C9HPz4HgF+Jqia/G
         gT8w==
X-Forwarded-Encrypted: i=1; AL+hErHhbk8STBl9VgT1ZrvHinLvYOV4HXuxF7mxumXUItAtyaQv9UYqMf3VdO3H9LGFrJfUNVmMfzwA0ekAKiMTmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VnCafNWzHeyMhRfs6sG7exEEYhPJKwV2JQlzF6cAZzS1DmVhR
	lDfGoGX1I94+fBJkL7FuKJrHQeG4mVZx8f12vml+i32rZIMYXeFyJ5BPGJ9S7Ep/M+rLIoP90NW
	jD83g2EkzqAo1b6/XROu85PQEjdj2B85ohB1960S3HJf548tdZsNEPO8clGxbOGJLpUkvnBsWQy
	hgFcnuO2sRxox+WvkLYOgRhLKJhXs4D9jcmh5mSh/Z+0/YHZ8QQGq5pptc5kWKgaPXNa/XFQ4NE
	vrSTj+fGW113nDldPFSB9hnCc3e
X-Gm-Gg: AZFdTZetTaKvSCCYgQejOi/V7fFquZt1ev0feTy7e3Sl7q4z/dixV7/Vhb2ls1gVNam
	zwKM33hRoNGyacX/PQbDBAD2cFBQiJr+qh7GyzNqeZMAU3rW+mMOfv/2KwdKmKYtgiZQv9D5gOD
	h5F2A0GmDGo4ZffhJKEBr2Oh4u1gx6hIQCA48TNVi0r+/1sbvygHuEFVRY6H37c/9MKlNUWdk4n
	tfcs4eDDZkAB6sDCmVaqatCwItGXmsiyBVVePCy91SxRaICGSlFP5rVW2Jz61WwxDIm1Wzx97uC
	RWp7cNirWDu8zJ8UDJCQP8LJpo8l9jwwS6zJBy9M8Qg5R+mVq/9YwXi/VA3tJ/NrXi7uMO5Wcod
	kV9dz932XzIeewSuCbQcVou34AOwYYWRhuvA5wQxSS3JBtgyOfrqFh1spV1wH65Kc10U6ibYBzN
	nz00rabNX0LpMpqzF7GRZqoE/oKi6jnLRDf6tME+M=
X-Received: by 2002:a17:90b:3f0f:b0:3b0:9409:6969 with SMTP id 98e67ed59e1d1-3b41c90813cmr7285090a91.19.1795378180721;
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm3600690a91.0.2026.11.22.12.09.40
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so487156185a.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378179; x=1795982979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmRAZestBbydW0V86ZHSxchFL97SOIM1Vg+4jG8J8+8=;
        b=U7q16PjP63Je0pHFRXcnI5DmOdy6uByjTYfkK0jf0/RKZ8/ck/ZnaQHINxwxu94ro4
         4liry/yWwg8iJxymRqPyTuobOW+UG+Ujqx8UvW5pWKSrdQVl2CO5PXvLGBw3GUJJ+K6P
         zQSebKQr7mzfh4NuONixx81Gtnl/EdrSxmgnk=
X-Forwarded-Encrypted: i=1; AL+hErHD3tVO7evWiIuOV/zMlRJIPntCHGgDV2yQ5ai73dadcRtD3iz5fVijIDMsrVW6RNa++nA6xWOc9Aukl5KPXg==@vger.kernel.org
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr1770005885a.21.1795378179133;
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Received: by 2002:a05:620a:1310:b0:949:6663:d1eb with SMTP id af79cd13be357-949b35c8cc9mr1770001685a.21.1795378178726;
        Sun, 22 Nov 2026 12:09:38 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:37 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 2/7] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Sun, 22 Nov 2026 21:09:27 +0100
Message-ID: <20261122200931.2090372-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-3-dev@deq.rocks>
References: <20261104151547.70333-3-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 4 Nov 2026 16:15:42 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The interface_create iovar structures and flags are firmware interface
> types like the others in fwil_types.h. Move them there so code outside
> cfg80211.c can create firmware interfaces as well.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 42 deletions(-)

Straightforward move, but not surprising the series does no longer
apply to the current wireless-next main. So a rebase is needed. You
can add my acknowledgement for this patch in v2 series:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
