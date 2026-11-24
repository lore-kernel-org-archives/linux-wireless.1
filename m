Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551237;
	b=yKVJAsQmqIbN77u82mqWUYKlv1ss1IsinrNQG0TblNHCXEWHVNtuCHOKYMoI01Ei2Tcj
	 FjkPNExsX/l4Bq+bBw58s+SqOV4kUsacYYHcIQUFyr+be9eEN10LQX0VVC8fB+p2TghWk
	 Dajx/QXMRwWe778hRRJztNWNfZ1lgBSgnL5L7O+vM4B7vfzhkF85lBmU3DXlH/1+xlYll
	 /VjpTVj6xJhY+n2zJfddUnwZoqHMzGbO8Mxptz/QN/AUS9SJQeHbbQWAAKMxVHTnrRH+R
	 E1O9336adi/9259Qywru+KtF3XBa3c/W+0QjYhIBTrmTLbn/stIqHKYXnxxVv6piuHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551237;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
	b=AAXlFZXwF15XzAbRqPh1LcO/dI3xJELgEceVZubUhfFjiOcz1jKi0YZhnL44L+VMkGLo
	 9mDibu+z2/Xus8tg/6Aikyhj1pMGHSdhlSVHT6dmW0C0Dd8udNEKe5s0dGIy6MYUngp/8
	 Oxz9gKXf0Eid48hgibJM/RD2LNNuWa0yRg29rfbotCfTflSIiwYOaXwjLTiPeaN18tIaj
	 8rD2/MjFs66AwqDZVrTVUc6fU1whVCV+qFbCj4gQ2J3X1DLkBj4fymA2nKnVrXr9oCRDX
	 fkWk6otnwRUbHsUcOLKOc7Sb45HjVd5Fq3sQw135DVj39vTuAb9RVPrqYDMv236p5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F2SWJf9P;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6195A606A323
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6195A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=F2SWJf9P
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so2492048a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551237; x=1796156037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
        b=0JBvjFu+7zzWJkQsuy3UOE0s/UVGYs4NLxhNDAksKFUx8fnREYcNx4+63oOk/L30VT
         IiJ3lnFj0Au+rXCRA3sKRHiyIuw/kj/HZdSnHDzJ9gVnbMjIuOPGkjuE73F31FSVHscA
         4Th2HogGSvLA6iR/3IXMjWJzUs+lu2Yf6qwffT445mE8Bq2EZnI12jofu1ZTPdCfKYv1
         ICctLQbEWR8O9XtraYX36WUG9CfK92VKxw/ScZFf0VnyCqhQOUtCKWSsw15PtaDLVFsl
         EYJEcJDQzJUQ6lR5IP40eIZsedpUepDG+bUyKdKMd0fQjrhLn+U0KnzWwx9Vqodjg8kU
         Abcg==
X-Forwarded-Encrypted: i=1; AL+hErF6oMfVQz4nzgYbONEuEzxEky48xGpnZEBEu5+ozs22LgjuRUWAJxZD4XCj3+CwseskXCjw9ovXhAefskuf+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hp/PG5LABVDijKRWCheIsKe5Yg496ZTYQJKsc+C8/Abljm+D+
	iycx/ed6HxwGDtf+g1OvuNwyXprc76Ln4yny5vVErMKfOAyldYsTicslX9om7n5+WEbwJ2k+pZD
	pkWopbSR4s26KXsK5FI5IZJyoMsaTy+5Hsfi0HffWE6cgTTg4NE/UCK9ANYQKOzpptLZVAEcyi/
	bEbCOok7Ml33M11GtP46YXPGX3Fc9ww0mx4s0lEywfq0PykhkeHPF6hk7jpbzW4w7g4RlAAvbw8
	lZbokEqBooi+H1cZJZFIdD7khbp
X-Gm-Gg: AZFdTZdMhYVqbS9K8v+KHaDYgHVv6++uEUQM19N+ll9J03DUHrl+NzjFNnZKQphBFuA
	ik2BL8IxgethkGhWP2SQ8PaDp3F2lu/xPR1uiO6q18fGQlslxS5f7XsGs97Hxv/nQ1tUmA9aB/R
	jJiVULRbJj2qByTKYCgwvIw4hLWzKh/BlzoagoN4xNX24Dlm2IhV4dT6UEZbyUHPln4AKcHUwot
	uGIPexb9dW02QPl+i/MPtiZwnFqkhm/g/GB9pQYHPQwXlq7paHG8nd13Q0oELr6Vyb8o+4wLqVf
	+AcKSodul9MnEdGS8/7Ccc4aMXkpg9iB6Z0UGweBpUG2dUNb+YuJ8NEqKulgV3o/oQS5gCePXOY
	aOAIVJB20ueUCUPUsQRTcbaVIqCJ94toL+uUJP0tUPCbXsEIBRROBeS3sA3dnIVA/G981XKOIB8
	ydFVf5LaLYNeaIN5mTKSsY0SwYXkTDNVmhrdVGsUlzEA==
X-Received: by 2002:a17:90b:4d10:b0:3b3:ce10:7659 with SMTP id 98e67ed59e1d1-3b41c7ac261mr14680231a91.5.1795551236725;
        Tue, 24 Nov 2026 12:13:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42005a1a1sm10887357a91.0.2026.11.24.12.13.55
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so967547385a.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551234; x=1796156034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gi6zvmo29Lhp6QPo1Sy6Pqw0tG3SiUIqhQEhH8s/5Vs=;
        b=F2SWJf9PqOmIVjrduE300d7rNnhvWlk+gZC751axjduniQ6Mcy5E8WFcE8sc23gzFt
         dzBdR5GXjHQr+jwQ2ILvjkgCkjxHT8D7GxG9kn9+RdP6+Pw5I4vn3QWr3LEnd+tDDAcU
         JMCLAa7FU9rDO49wzdGg8ac//4ysx7+Of5cdo=
X-Forwarded-Encrypted: i=1; AL+hErFOgDajff2yAEv0NDRSST4mKDTbYNCU9M0TkeV8q1f0tbz5yb+HOHBeIMn/NJqBzrlG/bUL/3kA2SLjSAydew==@vger.kernel.org
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr2711119185a.34.1795551234344;
        Tue, 24 Nov 2026 12:13:54 -0800 (PST)
X-Received: by 2002:a05:620a:6886:b0:947:7f5e:2b63 with SMTP id af79cd13be357-949ba99a9demr2711111885a.34.1795551233648;
        Tue, 24 Nov 2026 12:13:53 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f5c31sm1133479485a.30.2026.11.24.12.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:53 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Chad Aldreda <ca@modelmiser.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless] wifi: brcmfmac: fix join parameter length in IBSS join
Date: Tue, 24 Nov 2026 21:13:50 +0100
Message-ID: <20261124201350.3495772-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121092746.2917397-2-ca@modelmiser.com>
References: <20261121092746.2917397-2-ca@modelmiser.com>
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

On Sat, 21 Nov 2026 09:27:54 +0000, Chad Aldreda <ca@modelmiser.com> wrote:
> brcmf_cfg80211_join_ibss() builds the length of the SET_SSID payload in
> steps. It starts with the SSID record (36 bytes), adds
> BRCMF_ASSOC_PARAMS_FIXED_SIZE (14) when a BSSID is given, and adds
> sizeof(join_params.params_le) (16) when the channel is fixed. With both a
> BSSID and a fixed channel the result is 66, but struct brcmf_join_params
> is 52 bytes (sizes as on x86-64, where __le32 is 4-byte aligned). The
> length is passed unchanged to the protocol layer, which copies that many
> bytes from the on-stack record (brcmf_proto_bcdc_msg(),
> brcmf_msgbuf_tx_ioctl()), so 14 bytes of kernel stack beyond it are sent
> to the firmware.
>
> When the channel is fixed the whole record is in use whether or not a
> BSSID was given, so set the length to sizeof(join_params) in that branch.
> The other three cases (36, 50 and 52 bytes) are unchanged.
>
> The double count dates from the commit that added this calculation: the
> BSSID case counted WL_ASSOC_PARAMS_FIXED_SIZE, and the existing
> wl_ch_to_chanspec(), which that commit called after the BSSID case,
> added WL_ASSOC_PARAMS_FIXED_SIZE plus one chanspec again.
>
> Fixes: 69274f020a92 ("staging: brcm80211: Fixed ibss join/leave functionality in brcmfmac driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
> ---

[...]

>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
