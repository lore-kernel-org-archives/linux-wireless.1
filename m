Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917676;
	b=DE7IG67DsL3TKeUOiZmDv1HJEQChoweQglm1mdFKDsaV8ZUA6dbNlH8NbjYS7EPriL7E
	 0n2NtkKJXxwNzrjBLXH5VCIih5Ryaq21ZbT3pwlrDr4BNz3kMmFRnZHno9Dc8/S5hHINY
	 yPnsP0Pola1hTBa3luUx8tPuS3d1kS+5llw/UjiyzrE6JxBtjFoJfKO+SeOSAwJbBY8iR
	 +PPWYQhDFLZLLZkm75aswylkGvNCa8P8I6osXqBWw6vMQKOXq3MAQT+nxcohcNH7bI0Lk
	 BGc7XkAOKHFMWfaGem39c9DdbEgqVNWTIiMpbPnUNDp3eSrfQNONtn4PjhV76F27rSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917676;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
	b=cSRF78fNy6E1JwydJ5c9EYc3b9iJ/ILbJfcCfNPYwg8tZbkGhK5h26xTe6Kl9Fv+21sF
	 Zi8pRE2RJqAwuvsUc4H2XBUk/xcK0IyfEJzRntMT0WuhZHhQNYCekcPWoqGd3W5CXtAsQ
	 HTHQrh2/Lj/R/Sn89l1yo4CwS5dld28fOJpPYKaG/0x0MKBUB1Mx2+hx2o1I0cfDNDkbH
	 OhHoxGKL8AJHBrxdgxJlJHrtwD1O66HHutH6Ho2JtNl/yIuvlD8eJ+3tvHV8+lzX3MHFU
	 iWgYem5WN5jcoKP7I4UWykW6etPNh5pv6dx0iQOIa1SkJ982J4ZxQq7xUyAg5ixctUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E1eDnKkC;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B4C606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 12:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=E1eDnKkC
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3be948e60so158886a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917675; x=1795522475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
        b=ecD7/vL/nYbiltngXBalzXvq5UIm8t9s64qK9CwVL7NLpaNRVf6cOVwfcodCza9WFl
         ozlshQ9Wc6QZiUCYVIarH1gHuEgsJyEEcGHklvriRCtzGk4VtbdxDz5mdXZNRbBI7h32
         QMwnDooLM4J5xz79NlnuEJV5CPBVf+Sy1oL77Y6gBnzllByrMT2kut4/QrSUTGiE+U1I
         xNPtZlZX8EP+JabdrunFpiIfQ6B85ucPmwmYlDEudKfjbfP1NvdikzTZikX0lQ+DKujE
         xHru/cb3hYhu/G5Xlzx+YhfqSd+z6CEFFoX5H3Gsr7oJfdXGtWlrOoxNcvFG6vBcuVjV
         oizA==
X-Forwarded-Encrypted: i=1; AL+hErEIkGlDULQEXqzpPq9PU07XZKWHfSOFGKqjfp7u9gds3Gax9O+5FO2t3nRjXvq/YEHmFhuBpA0rFX++TW91Ng==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fag1OJO0+9bCu46EdI9aX19XcTrR3/mMLxlPrZu97pERWZn8R
	HW6ZnATNg++/nRufmxNIa30ZMHFHcGDWoGFy4bmPGwkA33Mv7IqWkx9cKRgT+7Yupii3ya1tU69
	VK+nA4CkHDXIwP/F49Q0ZPPr/sU3g5QahjRD3SNqoR78WgNsXjLYpA/nMh3jNTO4OXHbG9Gyb45
	TNOCfboJ88K2Y9gsCx290UUgFi5grHbfz/EAEpnwD48NdaKp+q11fg4X2uSFoTqz44cMkt/TXzF
	860QHiM3KQ2zVbS9y894sbuBw==
X-Gm-Gg: AZFdTZcCTuonuioin/5w18EijXJIQT4+cFr/AXfpOduMVo5CzGck9I/a5uvzXmOTHz+
	0aYvWzx4/RETuH0GIsHL1LQqDvuPUUouC3LGQsDYrDqw6HL2PCwf/fJA3/r3Rvr7d1y7HKututp
	dWqlCgZrJyjdC9ZpNf9Yo6C3CPH34lEIOoBmQnLDPFqoyq8AXtmEIyr9XnL6QEApW3lev8hjZA/
	i+nQ2gsNX3wvdtCRmx1xp0Ht//kTIU9Sj2TiQFkySKcDr4CnoY2CA90YBoHRZRSYs9YDcXHdfUk
	PWWUdAbdGswTHLQ31fOV2mdYWPicBwxPiBMcTuoi8d6edzePXlaPyRQTBVKeYEqzIHHDgv1+Epj
	xLX/CjpKgWVlbLu8D3aEHEeXGpm33tDkDxuhkF4KUbHreN9hPXu65Hg/ub/ic7jZfvsjVtBhHov
	rp/EqBOuFYbHPGjLhlmlA8IZMapgubgSDN0Dc+uog=
X-Received: by 2002:a17:90b:1846:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b1b0a42b64mr12370593a91.14.1794917675350;
        Tue, 17 Nov 2026 04:14:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1d1d744e2sm3712912a91.1.2026.11.17.04.14.33
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:14:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920fb8b9859so22991096d6.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794917673; x=1795522473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MNym97pzJ7qmUoiMY8sbiPQF5RpntmoauuiPw8uCY4=;
        b=E1eDnKkCNDqhQ1RvloNRC35WS80Yh4MY9ly09Cefh23LwR/BaP4NwIxXr2VK3jUF/F
         ezOXgjHy+JkA8LONAX6jWs9HXsamQ8QOTZQffxL/ubGTtvbmVvzSVliVHF1RBiaeKAxO
         LX69ffJzhTnEjh1IRoNHh+yiPtUDd3xKTYmqY=
X-Forwarded-Encrypted: i=1; AL+hErH6E6YouqKWmf52ZdHlPl8ramKD63N2exFL6KD76c6eeTFRP7xcDuBVoJXhRI1YEqaBdbHvOCYqlMbt6gG4xA==@vger.kernel.org
X-Received: by 2002:a05:6214:3b85:b0:91e:a540:e60f with SMTP id 6a1803df08f44-91f242030ffmr231618986d6.21.1794917673051;
        Tue, 17 Nov 2026 04:14:33 -0800 (PST)
X-Received: by 2002:a05:6214:3b85:b0:91e:a540:e60f with SMTP id 6a1803df08f44-91f242030ffmr231618536d6.21.1794917672489;
        Tue, 17 Nov 2026 04:14:32 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d952fesm108043226d6.32.2026.11.17.04.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:14:31 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jeff Campbell <inca.jeff.campbell@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: enable 2.4 GHz VHT on BCM4366 before AP bring-up
Date: Tue, 17 Nov 2026 13:14:27 +0100
Message-ID: <20261117121427.3299125-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
References: <20261104170426.4129715-1-inca.jeff.campbell@gmail.com>
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

On Wed,  4 Nov 2026 17:04:26 +0000, Jeff Campbell wrote:
> On BCM4366 firmware 10.28.2 (r769115) the 2.4 GHz radio defaults to
> vht_features 6: proprietary rates and 1024-QAM on, 2.4 GHz VHT off.
> brcmfmac never sets this iovar. As an AP the d11 PSM watchdog then fires
> repeatedly once a client passes traffic, the client disassociates and
> never completes DHCP.  This renders the radio unusable as an AP.

[...]

> Set bit 0, keeping the other bits, on the primary 2.4 GHz BSS of the
> 4366 family while the radio is still down. 5 GHz is left alone: it
> keeps 6 and is stable.  This stabilizes 2.4GHz AP and clients now
> associate, DHCP and pass traffic at normal levels.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)

> +	if (chip != BRCM_CC_4366_CHIP_ID && chip != BRCM_CC_43664_CHIP_ID &&
> +	    chip != BRCM_CC_43666_CHIP_ID)
> +		return;

Firmware 10.28.2 (r769115) is the version of both brcmfmac4366b-pcie.bin
and brcmfmac4366c-pcie.bin in linux-firmware, so the firmware is covered.
The radios are not: you tested the 43666 only (4366c image), while the
change also applies to the 4366 and the 43664. Please mention in the
commit message that the 4366 was not tested.

I ran this on a 43664 with the 4366c image. vht_features is 6 by default
there as well and the patch sets it to 7 when the AP starts. A phone
associates, gets DHCP, and the AP uses VHT rates (173 Mbit/s) on 2.4 GHz.
What I could not reproduce is the failure without the patch: the AP
started a minute after boot, on channel 6 at 20 MHz, ran 60 seconds of
iperf3 in each direction with the stock driver and showed no PSM watchdog
in the firmware console and no firmware halt. Which client and traffic
pattern trigger the watchdog for you? Please add that to the commit
message.

Also, bit 0 is the 2.4 GHz VHT enable. The firmware builds its own
beacon from its settings and brcmfmac only parses a few IEs of the beacon
that hostapd provides, so with this change the AP advertises VHT on
2.4 GHz even if hostapd is configured without VHT. Please say so in the
commit message. If that is not acceptable, start_ap() already parses the
beacon IEs, so bit 0 could be set only when hostapd provided a VHT
Capabilities IE. That leaves a non-VHT AP at the values you found
unstable, which would then need a different workaround.

[...]

Nit: "2.4GHz" should be "2.4 GHz" in the commit message.

Regards,
Arend
