Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551222;
	b=xJ7unWG81sjPhKy2WvXb5VOaCJWuKQ29Uvx/MbUYxhOXK49CHqlmf4+Md0x/panWZQ+V
	 Ps7zjffrSDJi6MWeRCFtRlkqnjl+QbrdF+XcDSJv89AU2sHKmXpxYV0CjlU1nipeIjoXT
	 6lcpNcQnVbKZ7dAOmDgAHABgmmBIBRHDYyGlPi8gKJm4bVkjO0mHjhzlOHPQsBR8U13Hx
	 R+9yTwhuVecKQv/3YS2JkRqR/D6S1MSISB/y7bZAoHW28eHkMZZ5Is8KMkVBuqtBLmn+S
	 G5OUP5AbwBWUG5n5zFsAYuSlvMiCh2dm9fWHx3QdMfJvJ7kk93OIOTgaKCcsS5x5PlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551222;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
	b=npS6elyrIrl/QiilvAvrKnl3AShSCmlWY+/icor4yiDf+jB/7/RClBFGk6nmQ2B80d0u
	 sunvZ1B1axAt/Y+26wOX4BM7+ZyC65m0tgXhox7VbCc3SxPIaZLsr7UegKJ0WIVbE+kl0
	 Ommkjdg1IDjWMc6tCugKuKwP8oouE9/uwX/SYcXopG+aZKxiXJg/+VbZBJHt9AGX45Nnv
	 HFT6GyhsaxQH2V7MiEa5wC1Uibb+LMPCd+C2ttMUyCR3Qdmc7Iej4hrAcuiMRlZDVc/eD
	 wuO1N/zLMLaMaMNLf7Z6223xf26kxCuYx+Hss6B8KtKaH+xe6f/TQf4H5rztVcnBj+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cBUMUjDG;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B565606A681
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B565606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cBUMUjDG
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2296191a12.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551221; x=1796156021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
        b=uVmPrqPjsaOGtEhOLoVeQYlwRhPVTxZ2XC1UKNw/f4+FKTu4JOgiFqYiPeCpMNWyLx
         Wic4ttbDoyx0tNcl/I0gWx5nWk6/E59hcpaRMbrephLfXxINc48mivgCfHwjgKgvvd09
         Ih+whLxhRbVy6NRtNjC0YEslKWxg2/WPHNYpvEpPAW4G7QlJNZBbCDret3rgeWFy/1Ck
         kDdbFlHk57k51DkmOjt7qy6Wtf4r3p9I2Sir1Ru4KLGYP6wsNXGoEkg7eluzNUWZoNbB
         MmKKdFbJppn0BHihSHChjckXzko0TCMoyhVDwhBU0ITxXwCq8Q5fEyTf/l6MSoHSCs4w
         p2ZQ==
X-Gm-Message-State: APuU4Z/YNAMed4hCUg03TYfp4hkp/GuDbsPXnkMY+kqkRrFlnDPzVkJL
	PROkvGP6lNcyUL/IkKK5tdVju1s7eTUh3JClC90Q4DTSBvSZAXsP96v5rooLZAaYKvAeuJ/QZXe
	C4VIW6faqgWvkvGJfhqIHJwCk5EmzLhmoQVNC+iJWdNe8g05Uhrn/Q2+UabYKwKu+rA7a5mbhNe
	iLXOOXa+STRrznvhCRolqAgdZMQADv82bCNMOUAq/AtHED5Ynaep0MjWGuN88fqWjhz92m3Hmyr
	Btf3rV16RQ/iWXnok6KHSdbPQ==
X-Gm-Gg: AZFdTZcik00Eww/MR9oeJwjiLPZw/lZjr1lkEqflsr+OAHlbERxgG/9q+nZ/MWROwJQ
	IFxmNRa6mMlIUIMrSkSlHYuFH5qta5xDXE23eueRDJNYLUhnlRSHXSYhga+HjvZCPU/0oiMwc+A
	gSjOfaEIgKEfd+j+yhhLXTpYmQYNuwxDPVV023KyeHDDH65CMPKK0Y18lptC/FipapkdHYyiQhJ
	NDOEWIZVLgDnifkgRZpsu9AR9CC/aMbybAWu/Tv+Eg+n+6m7Z725SaQajNuSZdIMlMBXyU8XcIO
	SK9xNSb6Wz4MjIP8JuhkUj/xIQg0ga1u77oUR5vC5lLBJ/DZhPWKoW4Qi0e0+7qCKGFpAloatXB
	JcKIA0Yv1obYVS2FED9PEAbS1vozUahSL3Jq5hD//HmiI1pQJpHU75l39hcwgN6uT1Zd1555ipd
	YM64d+ECz+bAUzwYQDtvtTh89Fk3iWEJULTd53oPU=
X-Received: by 2002:a17:90b:3d92:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b41c8de8d7mr12340132a91.18.1795551221280;
        Tue, 24 Nov 2026 12:13:41 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfb370asm6004720a91.0.2026.11.24.12.13.40
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:41 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55daa76673aso4162221cf.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551220; x=1796156020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKJCube4Y2RyuRH/FE0ONfBBOy0uVmoZeF4Sj/Uc/TA=;
        b=cBUMUjDGMLmrzZrsyp3N5M9LYqERAkiUr+7PQpbFUrLM6AL378G/WURo84inu6RViD
         2ycQ6DK05diIn/cadN13q1dDSZ4jLXGWmcI1UkeB0nESqZ5yiDZR56cL5yZ/pjd72l2/
         yZJoea7dPG8iFHdIwG/6ch4Vxp8wWwq9ytdIk=
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr2866153185a.46.1795551220197;
        Tue, 24 Nov 2026 12:13:40 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr2866149285a.46.1795551219842;
        Tue, 24 Nov 2026 12:13:39 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm80768285a.28.2026.11.24.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:39 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Tue, 24 Nov 2026 21:13:36 +0100
Message-ID: <20261124201336.3493037-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118141024.92354-1-dev@deq.rocks>
References: <20261118141024.92354-1-dev@deq.rocks>
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

On Wed, 18 Nov 2026 15:10:24 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK and, with "sae",
> NL80211_EXT_FEATURE_SAE_OFFLOAD_AP. hostapd and wpa_supplicant then leave
> the AP side of the handshake to the firmware, which doesn't complete.

[...]

> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/feature.c         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
