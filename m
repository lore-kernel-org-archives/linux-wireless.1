Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378180;
	b=kUXOzWFl546P7CaUdCOC1hRad0BsPUhR/KafrOJwVI1HwslBZaYHB8qDVKYFEs+eMig3
	 tlglh4/bFpCcqPWecrBVyNHXVhznofbL7Wqs5c4mHERC3PpA3nrQCgKw6MVck/JvqJbjR
	 TbYGHAd7B44fWWOUT7Or6Omz1iO44oPntZZ0XBYqnRsNMHx1CTDqz5qEXzQS/2it1N81x
	 UKSbAN58jnwN9VRRwNMQ5II+4SMcYhWCZ20RmdOixRonAx/PAoLELziUMiQ3Mspc11DpS
	 bKYxBfbcGp/dixP/cf4swo+bgu05zRt2MfisgrPINUogSYFGo9bvjKLFLPuv4Mozwow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378180;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
	b=BHo0xtZDUK8FSPAu3ui2EBWm4T0K/kKHmLG/q2bLOPE1E5O+a0Zzyqa5uNh9c5p93tkd
	 3WRRMCjvzQQ8sSo+dUZjmOP1vngfqzFsRFb3w6DMh+0o9cBJRVfYHpiqyMJM7wIVaIpuc
	 lLPPPog4qVpBXA5mKpYtbqPStm+d2BxJ3gnnJ6RmbXnGxpNR7eq0f56+b6ftdP2TIjO+s
	 P2bgF2evITA7FRobkgMizUI2UGrNwNRllOqPN2sfQfRhxQUZ8cUD93l+qCUKjfLGuOeZ0
	 upqzaxms9WhDrAqQF4VCE/yJ9wIXmtJCaKGhcBEnA79MZwlHaRBUkp6prDAnsLdIoSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GhOFQdm4;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053F2606A31A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053F2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GhOFQdm4
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso1919373a91.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378179; x=1795982979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
        b=G41RcwAKESpJimNpZT68mqNwClltIMynAaauiUfKQIBYLCbBcJw2QISFG95MfamPdt
         Tgc7Jd07GCF2BczWTzgZ7WEORxmfE6lOBdpYWZ5TFZrpS+pQuxe915j/wy8hqxztTS1U
         yzSVLs6nB868ZNUuHwJNGz2K/vq79Vsn/WHyqcNIb1q8gMsEdj8jjESfJMJtZzmU6kWd
         5SAoNgfFBn2IchZSdlny+W3WuX6hJx/JlxqIwjsRfHSRVoM4Jd/Dk6mbDoet5BvDr1eJ
         YGr7Tc7VbctcaHTTlBrp3QeSHR5fzgNhMTr1lP54alP1R7I48rXCWZxG17ZyK359yqug
         LTkA==
X-Forwarded-Encrypted: i=1; AL+hErG85Xvv5DXUN9uXv594ClkEsi77fZ2b0Ikw2sUMVPkQWswiEXA96dc/ro32/XNEx5e9J9D0Dog4767rp7l19Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9kJnWS/BKD+Bz7SbgKJz9XeNC4FPgclK9GSviqQwAFTsip+DRm
	g25a+HR/QvoBvhR+EVElpYWJ5b326M56nJbp3vkXYGkYGkGgnLsMV1x8bDCuTcelyj26sTua2e5
	TJni+wEWvMx5AwqkQUZnzwGkyJ3IapBsLUsZS4IP6VTj4QQtSKTBVQVUoG11sE5Ov0HZdL5QRAY
	nyreMTrdXDOADlSYXS2Wt8E7+vimCrE0lfhYGu3ujstaSoKl7LSLJJo0sJAZRiYvuan4AzR1L7j
	bV9relGC6pyX5J+9xFoeb08qihf
X-Gm-Gg: AZFdTZddn9zTs9W+6miVRJEsHHWQloKxz8iELaajPMLZViv+Adr2fgk09fp5TEJ6s3e
	KnsE3SujPLhra7qR0yAfodFjPn4cBLya4etLDbXnEczIc7oX2t3DUqTZLQU2PgBLJr+6kBhUdmX
	3GMHSnMZqu9Csd0xT9VvoekN39zlOVYtG35/b+ebPH8RYaH/2V+Nu7u7MJe2kIyZ0W0oQ/8qLEP
	abXDFvx+Vw6Pks8maRW7iCvH0oBU2c/i8wh54bfGuFPlmDsHNZQjO1pKDDHT2rymj4dXnDJCkND
	jpT2fXWYnnc5ja8s1E+/0ZIWi1zidTFM9aTnB+8tPFTspnZKjFRxc6d8Wb4R7b/c+2QQeu54W6A
	78vful/7gjbQ5dolSPV6dZPVDuArnW/UDD4QGdiZqCMBpHBFwzRHml9TxGz3rVv5MATecQNhvSE
	k4lLuHdl7yC/X5fJEhlAI/S5JlvVYjz36ZvWMb4u1tRQ==
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr10111125a91.15.1795378179342;
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffc5026sm2432570a91.3.2026.11.22.12.09.37
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so287896385a.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378176; x=1795982976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3EwjgeJ6UtU7zI/nL/aL33LjDXNX3Ej0qdxqErhzoU=;
        b=GhOFQdm4QJ8rjAkHe1DldB8CmJhcTorqSYwF13HRyZ6BRFboZbrAZ+E72IBlaqxuQa
         rkqxpSmtj/IEd1kzxl/Orbj9Ds/weCrCfT/PnHovlmjLBRpU7zzeh68EDtoDj2PjvUm6
         OVP2uDN7VcapKlWqF2BPuBskrYLiSg88+spdg=
X-Forwarded-Encrypted: i=1; AL+hErF5zSqbscLkGN8RYMYnQ4gaWLkTtDH2C7PKjPoavCo80fsyzdQ3lRDLOwdNY3wJMUdrj136it43TQ14zS2zwQ==@vger.kernel.org
X-Received: by 2002:a05:620a:2886:b0:949:44d2:3275 with SMTP id af79cd13be357-949ba9b9893mr1759710785a.21.1795378176469;
        Sun, 22 Nov 2026 12:09:36 -0800 (PST)
X-Received: by 2002:a05:620a:2886:b0:949:44d2:3275 with SMTP id af79cd13be357-949ba9b9893mr1759707985a.21.1795378176005;
        Sun, 22 Nov 2026 12:09:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:35 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 3/7] wifi: brcmfmac: detect AWDL support of the firmware
Date: Sun, 22 Nov 2026 21:09:26 +0100
Message-ID: <20261122200931.2090372-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-4-dev@deq.rocks>
References: <20261104151547.70333-4-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:43 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware of the BCM4364 and BCM4377 runs Apple Wireless
> Direct Link (AWDL) itself and announces it with "awdl" in its
> capabilities. Add the feature flag for it.
>
> An AWDL interface is created with interface_create version 3 and
> interface type 2. The host gives the MAC address, the interface index
> and the BSSID, which the flags 0x2, 0x8 and 0x10 select. Add the
> definitions for the interface type and the two new flags.
>
> The BCM4350 firmware 7.35.180.133 lists "awdl" as well and answers
> every interface_create, including the version query, with
> BCME_UNSUPPORTED. Keep the flag only when the firmware reports
> interface_create version 3.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c     | 26 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/feature.h     |  3 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h  |  3 +++
>  3 files changed, 31 insertions(+), 1 deletion(-)

Similar to the previous patch this one hits a conflict with the
EVENT_MSGS_EXT feature. Rebase needed anyway so this one gets my
acknowledgement:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
