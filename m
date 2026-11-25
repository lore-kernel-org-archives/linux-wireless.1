Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639036;
	b=aQFENVB81Q+qSRIR9BsLSpZceAY2Hm/5Eu/Dby2eUgF17FRZ3Ka947dhWacUrDSk2qpg
	 NymV9ZwxYg06KY1QTW5/5OU2DtK1o6pLetRmiUYEXF2tHNLsNh/q146H5dgu0qYBJlx4Y
	 SBd6WUz/1qtvAPk8y88AwGh2T/B9EqmxRdE6eYm+SyB/fw2boh4O8tWtynBJImy6XWe7x
	 qKbRhIlLz7V6pdGxSKvzupyZefBDMBFHuReZaXISQA0IHMjTfz6UhwF+nL2VNqUPRMSnc
	 rT2guvWSiiABjB3W0+Ebgs1Rcd/brqdzcfU9npIhoDlA2hXrzOe5sakKGi0yAjBSRJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uM94QE0TYPNheB2ffRJOQ/kVY8aqAYYyvQIO+dm/dJ0=;
	b=GpK+FdazU1G8YObxxYarFSDFwFWFO6VaBgZAM9Wgxy1vN0IKZpkzl+P9YYDDWkpl/1ja
	 sCtwKDqPjouGh4WYBW30qDEeKGhyFLIBLfvl/iRt/vuojq51IPbvo8p2OHVjyutj68aqd
	 KODhjJQV/GnXz41+F1EzJmQzeiIeHgYZMFp/rKxJyVPMlCXByRddmKYS47gPl7zHDwRfp
	 /Dkrbwe4GmCP+Rm9+018OL4+nBqQDAeCxi4UVWEooq9T7NF+hTTwJOx1Yilkkmmq4Jjtd
	 qH3hFzRAGiX4nqqe+2vBVZJnKzrPUU0JSd6KWKaP+DxSUHvyYZqYRZa21P07vFFlwsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vya3+18A;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25A606A330
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 20:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E25A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vya3+18A
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so48922765e9.2
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 12:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639033; x=1796243833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uM94QE0TYPNheB2ffRJOQ/kVY8aqAYYyvQIO+dm/dJ0=;
        b=Vya3+18Aqgr6G+X7cLOi23Eeff1ZPhQw9F9AlBmLx8ByXjYvJpXHeR2/U/SxGDS7w0
         W0L4vloGyAQ6RifY6OJA5E0KXH/42fR2yB1idRN2Qwptb+qYPpcFVkbbDd3JOyvaxyox
         3FxJvyCGVp2dbxVdGc82w9xMCxZxSzL0BNSL/WX7yotN0LPoLDiOb7xxZYxEYi4wQiZb
         Ol7DDP4b6LfY7D0AsxDRNWAqLZFAhxMUcEBIAFiueSSO54mVInISUIwjunJkVpnQX8l2
         X+95gulqzvOKDl+mTAW1feMP6q0tkPLg11HTBMdcQbaSfQgDMNf4C/Mi568tVDToUQ8K
         rWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639033; x=1796243833;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uM94QE0TYPNheB2ffRJOQ/kVY8aqAYYyvQIO+dm/dJ0=;
        b=gg6E3ePCkf73k0HoDh3KSaEmwUH9aYPUMmhiU8X8JnV47Y/UAkRnbICz61JJzt1sec
         IEgUGBI8Cg0Vfz+iuxGN3TD5bV9sdgh09KW35oj/HJ8vqMfpX+BF8zu6FIBvrC7MaFIj
         jfRITSvvcWfUpBqQkW4At6H3cuBw/rhJVNldHZzzRZPGAV18/kL7sy0TWeiRGU82Uu1B
         0Ytu7Zg25saAq/+uRa2yPTuYqKBvO8KMjmDHji5k0SGBHki0P2uHDkj1VpjitLgvLpwk
         tlOcS9hweLwRt8jjV3bPAdxnqtE2W5/tPmvGx609+tWCkfLa2wcRRgX3N003aCUoc8s/
         Nuag==
X-Forwarded-Encrypted: i=1; AL+hErHKX3Q9Yh7F58kPrK5p/VMpz6V/gu26gTB2sDMnEBq4V+roH6PpF1OOvvdbMr+cM7iAK7rYhqrjYYbu+G7qwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d53LGOjwpdZDjg3DhRKexOwZ1dqg2ggFeZm9+AwJ7dnVyXXGn
	GI6ZpeKRMPD2Cmy5rpBYe2BHvhEGF1r4YuJjIpcCzCzx18l7F0iRLbEq
X-Gm-Gg: AZFdTZeK/ZAG5Qx6zl7Tr1TX0beuST4SYP8C1cvcVbyjzxPWa59AHyTnAEwg4SxKZ8h
	E2I6o5N6vTECydvsfCeoB4gE6btbo5iy7nfxuuNz6f0FQ2wlbSLBDb7I4fVMjceXvdVvkeTKrVD
	wM2x6c/1StQc0U9OiJBQf0sOm1wp7QBcE87JtTIqyzJ/aAG+1kX3Z76toipXUmTKyvKHLmDM1IY
	FpKRIPPktfO5msh0TMdIscTUPYYtQMP5ADAu+kccJFqGR1ngeYUbukco3oQjsoEv847qZKozqxY
	ZPHNTHLf5wr/SF/r73TlYsgKxzFDY4lQtakjVGQgaCW5BmwzIx5owQchk7udR5KI2wRAO/YwL+3
	M5zWxIJgImzdQcyDE+WNETehIZwE7tdyAbmfqtymUY9qotYEIJvviMlgn97nmWDdZP8NManAxtz
	ESfEHNU9L2WmcqRxT4lNGeAH+xSCRr8rA3pa5iDb6niAbh2qlztwf4AmVyTEpb3At2ozCTYC7Fq
	NdMbgVSTqnE6lSeUWbZ/tnz+LiedOiUh70HcUSxaWtRX2rCta1qZQfFUsGDYzdUWAM+fM1pJSJw
	e2OGf3TcXnA9i83L6zy82Rn6VCXFalPB333jkA==
X-Received: by 2002:a05:600d:18:b0:4bb:9001:1aa with SMTP id 5b1f17b1804b1-4bb900102b8mr266635275e9.10.1795639033378;
        Wed, 25 Nov 2026 12:37:13 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1006004155e9.4.2026.11.25.12.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:37:13 -0800 (PST)
Message-ID: <2db4b526-1809-4ef7-8fe9-87b6cfcea6c9@gmail.com>
Date: Wed, 25 Nov 2026 22:37:10 +0200
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/4] wifi: rtl8xxxu: implement AP mode for 8188EU
To: Mehmet Fide <mehmet.fide@gmail.com>, =?UTF-8?Q?Georg_M=C3=BCller?=
 <georgmueller@gmx.net>
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
References: <20261125160616.1201001-1-mehmet.fide@gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261125160616.1201001-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2026 18:06, Mehmet Fide wrote:
> Hi Georg, Bitterblue,
> 
> I tested v3 on rtw-next (18d0bedbb5f0, context fixes in patches 2 and 4
> only) with an Edimax EW-7811Un V2 (RTL8188EUS rev D) as AP and a
> separate sniffer. I found three problems in the AP part, plus an older
> one that explains the duplicate pings.
> 
> 1. Beacons. After hostapd starts, the 8188e sends one beacon and then
> none. Probe responses go out, so clients still find the AP by active
> scanning, but association takes about 6 s and a passive scan sees
> nothing. BCN_VALID is set and the beacon function is enabled; the
> hardware clears the beacon queue after the first beacon. In AP mode the
> vendor driver (hw_var_set_opmode()) sets BIT(3) | BIT(4) in
> REG_MBID_NUM, commented "If set 0, hw will clr bcnq when tx becon
> ok/fail". With that there is a beacon at every TBTT and association
> takes 0.5 s.
> 
> 2. TBTT hold time. rtl8xxxu_start_tx_beacon() writes 0x80 to
> REG_TBTT_PROHIBIT + 1 and clears bit 0 of + 2; the vendor
> ResumeTxBeacon() writes 0xff and sets bit 0. On channel 6 with several
> neighbour APs, 7 runs of about 120 TBTTs each: 2-5 % of the beacons
> missing (one run 42 %) with the rtl8xxxu value; with the vendor value
> 0 % in 5 runs and 1-3 % in 2.
> 
> 3. macid in the TX descriptor, which Bitterblue pointed out:
> rtl8xxxu_fill_txdesc_v3() still does not set it; the vendor driver puts
> mac_id & 0x3f into txdw1. The same function also indexes
> priv->ra_info[macid] now, but for group addressed frames with a key,
> rtl8xxxu_tx() replaces macid with the security CAM index, which can go
> past the 16 entries of ra_info.

RTL8188E_MAX_MAC_ID_NUM should be 64 (hal_spec->macid_num = 64 in
hal/rtl8188e/rtl8188e_hal_init.c).

> 
> This is what I use on top of v3 for 1-3:
> 
> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
> index 49c167fd6ee4..9a297b077443 100644
> --- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
> +++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
> @@ -1154,6 +1154,14 @@ static void rtl8xxxu_start_tx_beacon(struct rtl8xxxu_priv *priv)
>  	val8 |= EN_BCNQ_DL >> 16;
>  	rtl8xxxu_write8(priv, REG_FWHW_TXQ_CTRL + 2, val8);
>  
> +	if (priv->rtl_chip == RTL8188E) {
> +		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0xff);
> +		val8 = rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
> +		val8 |= BIT(0);
> +		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 2, val8);
> +		return;
> +	}
> +
>  	rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0x80);
>  	val8 = rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
>  	val8 &= 0xF0;
> @@ -5572,7 +5580,7 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
>  {
>  	struct rtl8xxxu_priv *priv = hw->priv;
>  	struct device *dev = &priv->udev->dev;
> -	struct rtl8xxxu_ra_info *ra = &priv->ra_info[macid];
> +	struct rtl8xxxu_ra_info *ra;
>  	u8 *qc = ieee80211_get_qos_ctl(hdr);
>  	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
>  	u32 rate = 0;
> @@ -5580,6 +5588,10 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
>  
>  	seq_number = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
>  
> +	/* macid is the security CAM index for group addressed frames */
> +	ra = &priv->ra_info[macid < RTL8188E_MAX_MAC_ID_NUM ? macid : 0];
> +	tx_desc->txdw1 |= cpu_to_le32(macid & 0x3f);
> +
>  	if (ieee80211_is_data(hdr->frame_control)) {
>  		rate = ra->decision_rate;
>  		tx_desc->txdw5 = cpu_to_le32(rate);
> @@ -7002,6 +7014,13 @@ static int rtl8xxxu_add_interface(struct ieee80211_hw *hw,
>  		rtl8xxxu_write16(priv, REG_TSFTR_SYN_OFFSET, 0x7fff); /* ~32ms */
>  		rtl8xxxu_write8(priv, REG_DUAL_TSF_RST, DUAL_TSF_RESET_TSF0);
>  
> +		/* The 8188e clears the beacon queue after each beacon unless told not to */
> +		if (priv->rtl_chip == RTL8188E) {
> +			val8 = rtl8xxxu_read8(priv, REG_MBID_NUM);
> +			val8 |= BIT(3) | BIT(4);
> +			rtl8xxxu_write8(priv, REG_MBID_NUM, val8);
> +		}
> +
>  		/* enable BCN0 function */
>  		rtl8xxxu_write8(priv, REG_BEACON_CTRL,
>  				BEACON_DISABLE_TSF_UPDATE |
> 
> With these, beacon loss is 0.5-3.4 % at the sniffer and association
> takes 0.5 s.
> 
> 4. Duplicate pings. I can reproduce them with two clients, on one of
> the two and in both directions, and not with one client. The captures
> show the client sending the same MSDU again with a new sequence number
> after its retry limit, because many of its frames are not acked: 62-73 %
> of the frames sent to the 8188e carry the retry bit.
> 
> This is not AP specific. With the 8188e as a station of an rtw88 AP,
> same dongle, place and traffic, 63 % of the frames to the 8188e are
> retries with rtl8xxxu and 0 % with Realtek's v5.3.9 driver
> (aircrack-ng/rtl8188eus with kernel API fixes only, on a non-RT kernel;
> it crashes on PREEMPT_RT). I dumped the registers of both
> drivers while associated and wrote the vendor values into rtl8xxxu one
> group at a time. The difference is REG_OFDM0_XA_AGC_CORE1:
> rtl8xxxu_start() sets the IGI to 0x1e (see c8bc37602779 ("wifi:
> rtl8xxxu: Simplify setting the initial gain")) and nothing changes it
> later, while the vendor driver had 0x40 in that test. With IGI 0x40 alone the
> retries drop to 1 %.
> 
> A fixed value does not solve it, though. In AP mode with the two
> clients at -44 and -52 dBm, IGI 0x40 removes the duplicates but loses
> 35-65 % of the pings. The 8188e seems to need the vendor's dynamic
> initial gain (IGI from the lowest station RSSI and the false alarm
> count). Bitterblue, is there a reason rtl8xxxu has no DIG, or would a
> simple one for the 8188e be acceptable?

I think the reason is just that nobody implemented it yet.

> 
> Georg, do you plan a v4? I can send 1-3 as patches on top of your
> series, or include them in a v4 with your patches if you prefer.
> 
> Best regards,
> Mehmet

