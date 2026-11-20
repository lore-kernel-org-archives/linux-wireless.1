Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195878;
	b=vnJpxRv3+XUUmceSe3Q9RQmmajB+6tOcSB4sA2AivtOnYfNJonTDRXOeHCIkYdaqa+7p
	 jPHdvVNXDvGc6LVVmMZe8IqmWco3i1l0J2hF4bB+L/WrXRAjRbRkVtVkd53lRsPSRu88x
	 YRxR5jRMwHSNYtCcDIFrOsyo4qs+Wah1gxSgImFmX7TEcCStInn9aD7BbkyqxKyJMfT+O
	 qGmSQFcPGvdMkFpJmz2GhPrGGyOEqGQywTCitZ83koRIlsd7IsI6rasMPWHbtvLvQXyBV
	 /AK0EDT2vNfQb2x+qF6VBLe16cp1OWmqn9pyGjzgn0MXn7iQzjWs1UxcELkv5QXp0gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195878;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=Tpg2yEVyeRnZ2Za6/tg+vLxymPWoZ4TpmqYR5yfnLlw=;
	b=VLDhTLkowJ+xSvK/mcrOgFJ7UZrRvWCLwM673HsPpKINrBa5anafcD6FgYvOC+F6stJ8
	 U+2DQO7L0ivmJgzAIrZMaj4Ek5z8j2o791yu0GaSkPXTNxZC9dNkas9/lPlHV9OuJpBJ2
	 Lh8PXPIAn0E3PneHEIjs09pmT7YoyPpUCNs7Hh0O3/DE5CbXmlUyxoxesK7H3B9stWJgD
	 E/fM5seLU1PV2ohFOAUpFJr3ucsrdfH4MA6xruE6aQYtGyH8IEUvMX/W+Z1+Rfghsc633
	 gSoDKS4j1SFNjfwgyyXp0R5xOTqvU070b7KXgbymeKQHEVBheaMZzs2qg+rWgcgTawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pt4crqP2;
	arc=none smtp.remote-ip=95.215.58.88
Received: from mta1.migadu.com (out-88.mta1.migadu.com [95.215.58.88])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91469606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91469606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pt4crqP2
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IZrAa4SoFoqBjr7u1Tj8Wi9+vNHMC5vGhVqZrPFCXNw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795195874; v=1; x=1795800674;
 b=Pt4crqP2BYskDr/kj99C8eN9VWAN6b6+CX51anHwOP/UemQOthxnLIbAuDvgnfSo5WzphEsn
 zQAtL85dAxm+TmcdQtFtLK3rJYrAK4N3oNLGyutmwVZNtNJornyya0fcc5xHT1+Lp1y0TOy+hls
 eKi0sS6Zn02dQ9pQCyAROXX8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 07b9f6c2dc59ba5f;
	Fri, 20 Nov 2026 17:31:13 +0000
X-Mizu-Trace-ID: 07b9f6c2dc59ba5f
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 17:31:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <95610ac92e284b3b7b32981e14c380fcda09fcb7@linux.dev>
TLS-Required: No
Subject: Re: [PATCH RFC rtw-next] wifi: rtw88: raise the TBTT hold time while
 beaconing
To: "Mehmet Fide" <mehmet.fide@gmail.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
In-Reply-To: <20261119102953.4035731-1-mehmet.fide@gmail.com>
References: <20261119102953.4035731-1-mehmet.fide@gmail.com>

Hi Mehmet,

Thanks for looking into this. Below are my thoughts.

November 19, 2026 at 11:29 AM, "Mehmet Fide" <mehmet.fide@gmail.com> wrot=
e:

[ ... ]

> 1. The captures suggest the MAC drops a beacon that cannot start
>    within the hold time. Is that how it works, and does a longer hold
>    time delay any other TX? iperf3 and ping through the AP were the
>    same with 0x064, 0x0ff and 0x400.

Your captures fit a beacon transmit deadline. The RTL8822CU vendor
header says data queues can also wait during the hold, so I'd measure
latency around TBTT under load.

> 2. Which value do you recommend while beaconing: a fixed one, or one
>    derived from the beacon interval? With 0x0ff an RTL8821CU, a second
>    RTL8821CU and an RTL8822CU had no such seconds either, but an
>    RTL8822CE still had 6: its beacons were cut off at 8.2 ms.

I'd start with 0x0ff and cap it for short beacon intervals. At 10 TU
that leaves 2.08 ms before the next TBTT. I'd measure beacon loss and
data latency before raising it on RTL8822CE.

> 3. The CSA series [1] downloads each countdown beacon 10 ms after TBTT,
>    so a hold time above about 9 ms needs a later download there. If
>    the reserved page is rewritten while a beacon still waits in the
>    hold window, which beacon goes out, the old or the new one?

I'd expect the old template if the MAC has already fetched it and
still sends. Your v13 tests also saw missed beacons during a write.

At 100 TU a late CSA worker can pass rtw_fw_csa_hold() at 6 ms after
TBTT, inside the 8.16 ms window. Could the guard account for the hold
and beacon airtime before a rewrite or switch completion? It currently
skips intervals of 20 ms or less.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/ne=
t/wireless/realtek/rtw88/mac80211.c
> index 3029fbdb288a..cb1deeffef71 100644
> --- a/drivers/net/wireless/realtek/rtw88/mac80211.c
> +++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
> @@ -449,12 +449,19 @@ static void rtw_ops_bss_info_changed(struct ieee8=
0211_hw *hw,
>  	}
>
>  	if (changed & BSS_CHANGED_BEACON_ENABLED) {
> -		if (conf->enable_beacon)
> +		if (conf->enable_beacon) {
>  			rtw_write32_set(rtwdev, REG_FWHW_TXQ_CTRL,
>  					BIT_EN_BCNQ_DL);
> -		else
> +			rtw_write32_mask(rtwdev, REG_TBTT_PROHIBIT,
> +					 BIT_MASK_TBTT_HOLD_TIME_AP,
> +					 TBTT_HOLD_TIME_BCN);
> +		} else {
>  			rtw_write32_clr(rtwdev, REG_FWHW_TXQ_CTRL,
>  					BIT_EN_BCNQ_DL);
> +			rtw_write32_mask(rtwdev, REG_TBTT_PROHIBIT,
> +					 BIT_MASK_TBTT_HOLD_TIME_AP,
> +					 TBTT_HOLD_TIME_STOP_BCN);
> +		}
>  	}
>  	if (changed & BSS_CHANGED_CQM)
>  		rtw_fw_beacon_filter_config(rtwdev, true, vif);

To me it looks like a station scan on RTL8822C can pause AP beacons
through rtw_hw_scan_chan_switch() and rtw_core_enable_beacon(), leaving
0xff programmed. The vendor driver restores 0x64 on scan pause. Could
we update the hold on scan pause and resume too?

Best regards,
Luka Gejak
