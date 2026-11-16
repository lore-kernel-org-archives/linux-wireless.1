Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861455;
	b=1DEtKzVicodPfu0tSPXshY+Dc3xW4pegAToh78yJL1oRlDJq1MZYUZaD2LYu0pqTuobV
	 5N+u3SDSTXhVolmICzXCj6XOAa+PxTQeawVVsSlAiSP2fynpzHuaQkQdGfp76/loSbLlW
	 RlMjxHq60ya+X0xLBiMx/VQvHWAMRkrWiP50iHSBybxWt+n2/DUK8hLiAcb5QN3QNtSPG
	 Ezqnxz9/RwKiZEq8wSxyOzbUVSp8g9pXb6nKApgf4Bb8WSFpC3EAICJAEZKS9+/2Ocry5
	 bRdzcoiPtM5Id/qAN9JGd5FXchcZk9qn0URrj9T9TH4Itxpkeq60YZ5e1CzRG5kReBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861455;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
	b=U1YtriUrjp4iJdeINvYbc50TKZ6s8wR3nP5jCOObh8Y3fuotHsSpUifhsz7wV7d2lq9o
	 +b6OKNx0r7/ghPGkcuhMCqh52xuVkLu2VYc4k0MOYUze44tpqbT4CczXrTOoTsq8c7Wd3
	 VpMuAGlFFBF2M6feazZtqhGIVWWeEg+nzcJpwBhOdWI3adwAHzyuWdZmpyN5jV8rO2lK0
	 SnBK0eE8rTZUSNYbZksBU87y8T7WVL7GWFNCzB8E/6PQ7RCEGfQbuDj2+zP6d7ZNWBCXz
	 FC9eGa/qe4CQBoZHa7UJTYaBcPuArMeOpzmo0FkhVQAV4UfRttfGXDSutxrUM9ov2Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="CqKg/qhX";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368D606A32F
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 20:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0368D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CqKg/qhX
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso149488a91.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861454; x=1795466254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
        b=vtphipXBlu70hvf6SYGExGlJEP1yk+N2TyD8PqFXp3ZFgvrXD3rJ3UHJK3AtJU2T4c
         Ewt2WvULY9g4gXMa8WCPqyehtvM9O6yI77w4jtIdPAbP1nISZ72LlNY4K0zg/+HyaLoY
         Wwmnah13hKQfdGz6DF99o2MB7PvfBrIeeV6DvMYY9uNCBkvHEmeTCU4GNLeQcHWSFL8r
         t5CQUAnd2JMj2LiTvxnvnasbmeu13TE9F/yC0p3fFhp3MGbQputmtbDwgSP2WbXOATZD
         ji/oVK2eNLQ75Yzlh/TXQVF3bZfO2k03xim6lIjRpt7rmMZWdOcuZwAyv0dVARKGSKgH
         cNaA==
X-Forwarded-Encrypted: i=1; AL+hErG+5JacKRmVSMs8RCFy8IjARoRwyzj1578w6JCDRvGN4ZvP4rBoC7ucRSvTI0hFk36wVaYCX11kSR94Ycjm6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8NA69qcLCGSRW1zAibfI72XftSnAUwqpJB6JP8JmqX+uI0n4zH
	02mRNkN4h8twjdGsu9uh0hZI6dwZqy2egpB3zJDRwfbRRNiPgmQydB+L561g6dmLG9iVeFSq9pD
	dRuL1ZGUhqcyhEM9yy3CRTy2IS5mOypffnxrhfm501m63NthgRrbxqZqqZDM0GhF9fM6TtR+HD7
	VV0hmlfs7ZJX/TuiYZskPvNCdsB9XvFbpyUEm0MxdmFHFOabwF/HS7iSgzd+kaFYvfjMx/azx5F
	lmri7tMN85NJvY3aQs8WEp8I4+t
X-Gm-Gg: AZFdTZdGQL7BSs4D0HIFCVCsq/SSwk1x6UjWZKIpDwizekLSoxaJGR68QoBkjV+C23C
	N5dJyAfEg+xsg8Esn5BTli6yYAYx4b4RoR8bbEB3xGaKiJExOUifyjx7ivLE8ar3Ac0wdI9dg00
	KNM64L8CVh+cJq1cETuXB+4BhyESv6UALAu0upot/RD4/7gOFZd99dpP830rrk+bmjVFKuFkcL5
	a11EUUuE2NwXpddzOeaMpuGF0ivvsjH1M9WeEyT7qFXBvyjofQn5SBU68W1ANmarlGPfkyEIGwe
	4B8CeJUg7nEEg4U7Hq2FBmCtj0WjrU9rmlX/dw9FjJbZRDbaxlbxAgMk8w9/SFyHD3I9kVMBtWw
	nDRE4LoC8vThlKZi0BjGC8byoBPN5y1EfNf66aDGix/1Wxh8twc5Hze9QFFHK/YaliRahiKQVUe
	sOxx3bQslrEB/NVYdq9gckFAyLOK6ZWRtUFey8QLniAg==
X-Received: by 2002:a17:90b:3c12:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3b3abcdf380mr361541a91.27.1794861454113;
        Mon, 16 Nov 2026 12:37:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a71eb9sm6204827a91.4.2026.11.16.12.37.33
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so187693eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 12:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861452; x=1795466252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
        b=CqKg/qhXQEIpOo+V3be8bAEE9WrJWHT2iEpICW8UKKs8EH5fxhAH+F/anov47GR5lX
         J2CtFAuPOqy2LmtGCD2zLAkUgKU6aPYj2xKhpckNTo79CsHK193PNuk1nysfDf1ZccTO
         4g8a6qqPdQHAePNQ3ApQ8IvzLpqRZEycGvCq8=
X-Forwarded-Encrypted: i=1; AL+hErFNT0tJy25QPeetUfqTskFivoRFORN+cBA6/RMUiZKswgT3rMbR7jtswsoC5nXRf26T6VdvFwJCaXITG7ee/w==@vger.kernel.org
X-Received: by 2002:a05:7301:3a91:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3810cd4e36bmr522311eec.11.1794861451754;
        Mon, 16 Nov 2026 12:37:31 -0800 (PST)
X-Received: by 2002:a05:7301:3a91:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3810cd4e36bmr522268eec.11.1794861450737;
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:29 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Mon, 16 Nov 2026 21:37:19 +0100
Message-ID: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151629.70790-1-dev@deq.rocks>
References: <20261104151629.70790-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
> then pass the PSK to the driver and leave the AP side of the 4-way
> handshake to the firmware. On the BCM4364 that handshake never
> completes.
>
> [...]
>
> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
> runs the handshake.

[...]

> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>  					BIT(BRCMF_FEAT_WOWL_GTK);
>  		}
>  	}
> +	/* The Apple firmware for these chips lists "idauth", but in AP mode
> +	 * its authenticator never completes the 4-way handshake and the
> +	 * station is dropped after about 8 s. Leave the handshake to the host.
> +	 */
> +	switch (drvr->bus_if->chip) {
> +	case BRCM_CC_4355_CHIP_ID:
> +	case BRCM_CC_4364_CHIP_ID:
> +	case BRCM_CC_4377_CHIP_ID:
> +		ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	/* MBSS does not work for all chips */
>  	switch (drvr->bus_if->chip) {

The commit message and the test report only cover BCM4364 and BCM4377,
but the code also clears FWAUTH for BCM4355. Where does that come from?
Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
or justify it.

The chip ID check has the same problem as in the ARP/ND offload patch [1]:
the issue is described as specific to the Apple firmware, but the quirk
applies to every BCM4355, BCM4364 and BCM4377, and those users would lose
offloaded AP PSK. Please restrict it as suggested there.

Note that BRCMF_FEAT_FWAUTH is required for NL80211_EXT_FEATURE_SAE_OFFLOAD_AP
in brcmf_setup_wiphy(). Please mention in the commit message whether
that is affected on these chips (i.e. whether the firmware offers "sae"
at all) or confirm it is intentionally dropped too.

Have you looked at the actual root cause (e.g. missing/incorrect
"idauth" related iovars such as setting the PMK or wsec_info for AP on
this firmware)? If the offload is never usable on these firmwares, say
so in the commit message with reference to the firmware version(s)
checked.

[...]

Minor: please add the target tree to the subject (wifibot series_format
warning).

[1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

Regards,
Arend
