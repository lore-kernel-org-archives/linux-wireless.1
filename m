Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918625;
	b=AbTKmKy1s6oIuawGkBbK6cYr0WIgvb3+f9X26yR3yo2NMTaA0icYCla/8uQV1HOrdsRo
	 2H+s2hbPFJ7Zdvx7tfLxMim/podX19OtdQH1g6L0dQ5D012TtAlnPMd9k8nW6y+iM0pjx
	 mK922KrIpzRnhxDwA6g5nqX+1dhqvYweJTY3yemiyGiWi9+txlJets4TFYOFjnVauxlE6
	 jdqbqn9qovqlXYzntHyZil2e07R4Cz2rqug1MzZujNk03yyMfPn/WVjha07OB6Ob6wOlo
	 8ABcrRWTd6InSOER4b+gJwkQC2dWXn2ogfx7H/NrTUJfbTA9mGl9a2Q6u1JjUV2KqpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918625;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ts8C8PjqK3ohgkWdudfpwxDXLz92B8zNCAL6T1JLvv8=;
	b=OfTj27QwLQt10GBj276NbJP0xT1yWDeOPHBOg3BZpdGfTFrMrq54VwvxFJaK8lFCfDkC
	 3a4p7VyKwBB/WUgfznLu/I8pu8hciHfuPVyOHwNZL7ZV1LT4gja02U8kuU1wdeBqFWd/W
	 PEvJOI0YDdEYP1/LcqwL4nRNKN8/6MUMIseLruPgsDAuiAIO96FNn/rovkJuskM1KzEeI
	 48R2EPmUp/EkCHU+xxE7EzwOBhIMn31geSf22dj3JJWvdYhVLRn50fUhkdKAzFXK26PkO
	 VBufrEBajh/Fkvk9ST4gyMccHJy5HfZJFD64EyBn27UXETu4XA3P5I23JGuWdWpVJaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LMkXN6k1;
	arc=none smtp.remote-ip=91.218.175.128
Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B2606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 12:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LMkXN6k1
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9CE8kdPMbpoUdF+DUxZ871vgaHvH6qUQxvA5Xm28x4c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794918621; v=1; x=1795523421;
 b=LMkXN6k1kPZRcng6P4gi23RpZnXkx1kHDIw/nsuUe/VT1soYJxP0PZe8hSFPD/UMpWUrv7TU
 7PBKoHyIegFYMWbjz0YPqBPnhJRFtgB48snLVJmoLQdX6cxNW8uYZ7N9Ynl7742cPvMGaFyNc7x
 zbllUhb2hdh0+Ve/n7KwyQcw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c487314d3f362298;
	Tue, 17 Nov 2026 12:30:20 +0000
X-Mizu-Trace-ID: c487314d3f362298
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 13:30:15 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v2] wifi: rtw88: program the beacon interval
In-Reply-To: <20261117101419.1687892-1-mehmet.fide@gmail.com>
References: <20261117101419.1687892-1-mehmet.fide@gmail.com>
Message-ID: <AF1A064D-D778-4269-BE69-060FC29532F4@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 17, 2026 11:14:19 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>The driver never writes the beacon interval register, so the hardware
>keeps its default of 100 TU. An AP or IBSS started with another
>interval says that interval in its beacons and sends them 100 TU apart.
>
>With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
>RTL8822BU and RTL8821CU are 102.4 ms apart on the air. The same holds
>for an IBSS joined with a beacon interval of 200 on an RTL8822CE and
>RTL8822BU.
>
>Write the interval when mac80211 sets it for an AP or IBSS interface.
>Both beacon from port 0: rtw_core_port_switch() moves an AP there, and
>an IBSS interface is never combined with another one.
>
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
>Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>
>Notes:
>    v2:
>    - write the interval for an AP or IBSS interface only (Ping-Ke)
>    - Luka's Reviewed-by not carried, the condition changed
>    - rebased on rtw-next fb51e39dfaea
>    
>    Tested on rtw-next on an RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU
>    as AP with hostapd, the beacons sniffed from a second machine: with
>    beacon_int 50, 100 and 200 they are 51.2, 102.4 and 204.8 ms apart on
>    the air. As IBSS on the RTL8822CE and RTL8822BU, joined with a beacon
>    interval of 50 and 200, the TSF of their beacons shows them 50 and 200
>    TU apart. AP, association, power save, firmware crash and scan tests on
>    the RTL8822BU and RTL8821CU on both bands gave no new kernel report.
>    
>    v1: https://lore.kernel.org/r/20261116072022.1142783-1-mehmet.fide@gmail.com/
>
> drivers/net/wireless/realtek/rtw88/mac80211.c | 5 +++++
> drivers/net/wireless/realtek/rtw88/reg.h      | 1 +
> 2 files changed, 6 insertions(+)
>
>diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
>index 5e40cf06a9e3..26bc4a9913be 100644
>--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
>+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
>@@ -432,6 +432,11 @@ static void rtw_ops_bss_info_changed(struct ieee80211_hw *hw,
> 	if (changed & BSS_CHANGED_BEACON_INT) {
> 		if (ieee80211_vif_type_p2p(vif) == NL80211_IFTYPE_STATION)
> 			coex_stat->wl_beacon_interval = conf->beacon_int;
>+		else if ((vif->type == NL80211_IFTYPE_AP ||
>+			  vif->type == NL80211_IFTYPE_ADHOC) &&
>+			 rtwvif->port == RTW_PORT_0)
>+			rtw_write16(rtwdev, REG_MBSSID_BCN_SPACE,
>+				    conf->beacon_int);
> 	}
> 
> 	if (changed & BSS_CHANGED_BEACON) {

[ ... ]

As far as I can see this is the same as v1 just expressed explicitly.
Either way I am fine with it.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
