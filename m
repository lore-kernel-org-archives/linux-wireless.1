Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655406;
	b=0AWySa91eeA+6fnUBLz4VzXUeXqgmvCYmddU4TE16qPajYhqoqfPTbnlc/PaxqFfE/zW
	 apjDRG2FmXJ2SccUQCZBZ0YtAkq6HOo+TB/uqiKEFll91q+YNoFg3Y3Utu4BT6fX39O9t
	 uz2TAaNMpFtXXFW0zMQaANkr2J5V4IWBjyEt+E17clca5Oo6p5xwaRHSJu8CfesKXJplh
	 Vc2C6fRvFw8M4mxJonFv8J+FcWqR1cp3d2wfXruOK7FbihZQpabLD5ObNzesRAOtIgat/
	 py4vqaPmYDpgIT4P2KtF2vOamE0JTbQhLEXkOeXeAz19PkbnlBC2DMVnjj1+OVX+Txg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655406;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=C6ej9YMBViORYYLZcwgIKXzaNjwMhWgiVH1RQcX3cMM=;
	b=RkqxyT7RN5S/ArOoqodX4dknKA3rbE4utQ6kxE5GLG3NbpVIDTXDQ9StBPMF/ifAIvab
	 iQAEwIf6eGbid4J+uxLnr59S+VDkgOfFIHVbfx1NkBR/JaxMoOGVkdd0qKzM25c//VCii
	 6Df6CddLgEJ/xSd2pEzrF0Q8t/1i0zwFungh9gtcoJklLB+ZicRuHm1R4tfxtNt5O/jm5
	 C1w1l3xxfj92qoZomXOfmohKLQcqMOrCbHliqCUQd9DpcSCaHL/5uor79gvDGiQ+BcZ47
	 uUpHlNEgDkv8QGFqjkcIJE1SKNLignQbb5L9fy847hLCi1b5h0oO9Pqt6a8f5n06/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b="slo/RXKR";
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B2606A69C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 01:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606B2606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=slo/RXKR
DKIM2-Signature:  i=1; m=1; t=1795655402;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:dc8uhwHZMeTA1oDB/g88te5tR39n
   VVndNH165SP6zBBIOfZcYKmd+qqMfiyAS1f7p3gSpU4seGgeOCh7yXhJSIbfPYAIRz1Z2KGOcjK
   DWxQPE5AEIwqbYAZRvjyZe74/rGBCxDmmjcVH/jVjXpCxUk32WMeMd8axMaUx7y1X94VxUYsYYa
   8rsVhGA6SmLUSUUt6pancNAytShARRIfwXpDqu5YXsKCzr7IIgW/IqRqD9CHjbtSVdiiWqoR8NL
   5PCFthaoap1xs78hk8VrpLgYm46bfZEvYVGG5RixQz+qe6fRSBJljkegskyRKCtU10cyOyEnSHB
   WYVrgNMkQlOcwQ==;
Message-Instance:  m=1;
 h=sha256:
   dQbE7PMKqCv7M6jEROAaMeCHKC526xFGQ+NbYPVkYqI=:
   0Q9tGYOV8xt1RJImd/TMOTjAsx33mW34BFgsqRwRdLA=,
  sha512:
   4K9NaLXWRKPosHJcKd+/lLB1OJudPbGdoVjK4ifl/7+HeYyJCEZTXaMplG7bsBZEazPiuK8o7XJjWt4LFtAY2w==:
   63fM34jsZlmf9aJqi7/NnLSllaq3GgDCUrJHhQk+veujRCYxn7vfpP7DYtfms5yD+p1BpbYHmD8ZvRsscAYGiw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795655392; x=1796260192; i=georgmueller@gmx.net;
	bh=C6ej9YMBViORYYLZcwgIKXzaNjwMhWgiVH1RQcX3cMM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=slo/RXKRC2bPG5OyLTzu65CthtxfN7xGAjtsA4WqFW/R5x0UvexQbtc8pQ+03dL9
	 h+bkKdrHlmHQr2CbGNtOT9tBzJCP4l5g/WBgAnjKQ35Et9+jUX1Q27w5yvy/urYq/
	 T/pCuUgQh9YvyaEonHW/lsIvDz8acxZur65SWSyI1Xna1Y3NiI7gqbSZ7Oxeba1rk
	 Espzq6U3dpD9NZ4IgzCZsOPEWrNYwz4mMAXZvS2X9DmIuQu0l/ugUptUDT9QayUhq
	 CsXm6S9NMGfRif/BVNcTJxCJ0i2xScgfwrrvvAITi4eyMmCKdF2WiMcwdWvq3Jkhw
	 A3g4U3DzwcHYRR6bgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1yJFTK1RHy-00hIJW; Thu, 26
 Nov 2026 02:09:52 +0100
Message-ID: <03be9df5-43e3-48f6-98bb-27d7d7ba2074@gmx.net>
Date: Thu, 26 Nov 2026 02:09:51 +0100
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
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 Mehmet Fide <mehmet.fide@gmail.com>
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
References: <20261125160616.1201001-1-mehmet.fide@gmail.com>
 <2db4b526-1809-4ef7-8fe9-87b6cfcea6c9@gmail.com>
Content-Language: en-US, de-DE
From: =?UTF-8?Q?Georg_M=C3=BCller?= <georgmueller@gmx.net>
In-Reply-To: <2db4b526-1809-4ef7-8fe9-87b6cfcea6c9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pli1EqYNzfqFVc4iYOKtHjsf4HaL+cZqP15ItosqC2G6wI39jU8
 7BMw3RxRKr0ovq0uRDsXDl4MqMewvVhPtCLvYB+Bh58vPPa9ocIqKD9gwIDmxVGVGAkyzxC
 smwBILRyqyqIOm+K2o4Q2nYNEHKtn8H8ZFzqkEU/GNi/v0uMAou2agSvSeTH2GnAYw0WM6N
 yGtlNs+sAiglDOkDiGbqw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p0LKXfhXU1s=;s0YHeZxZhr1nSfsDsRB4+bYEYki
 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

Hi Mehmet, Bitterblue,

Thank you for taking up the patches and for your investigation!
I didn't have time to look further into it. The only thing I changed
(but didn't post) was changes in the kernel interface, like using
devm_kmalloc_array instead of kmalloc_array and starting to do some
of the changes mentioned in the last review, but I didn't have time
to test it in detail.

Am 25.11.26 um 21:37 schrieb Bitterblue Smith:
> On 25/11/2026 18:06, Mehmet Fide wrote:
>> Hi Georg, Bitterblue,
>>
>> I tested v3 on rtw-next (18d0bedbb5f0, context fixes in patches 2 and 4
>> only) with an Edimax EW-7811Un V2 (RTL8188EUS rev D) as AP and a
>> separate sniffer. I found three problems in the AP part, plus an older
>> one that explains the duplicate pings.
>>
>> 1. Beacons. After hostapd starts, the 8188e sends one beacon and then
>> none. Probe responses go out, so clients still find the AP by active
>> scanning, but association takes about 6 s and a passive scan sees
>> nothing. BCN_VALID is set and the beacon function is enabled; the
>> hardware clears the beacon queue after the first beacon. In AP mode the
>> vendor driver (hw_var_set_opmode()) sets BIT(3) | BIT(4) in
>> REG_MBID_NUM, commented "If set 0, hw will clr bcnq when tx becon
>> ok/fail". With that there is a beacon at every TBTT and association
>> takes 0.5 s.
>>
>> 2. TBTT hold time. rtl8xxxu_start_tx_beacon() writes 0x80 to
>> REG_TBTT_PROHIBIT + 1 and clears bit 0 of + 2; the vendor
>> ResumeTxBeacon() writes 0xff and sets bit 0. On channel 6 with several
>> neighbour APs, 7 runs of about 120 TBTTs each: 2-5 % of the beacons
>> missing (one run 42 %) with the rtl8xxxu value; with the vendor value
>> 0 % in 5 runs and 1-3 % in 2.
>>
>> 3. macid in the TX descriptor, which Bitterblue pointed out:
>> rtl8xxxu_fill_txdesc_v3() still does not set it; the vendor driver puts
>> mac_id & 0x3f into txdw1. The same function also indexes
>> priv->ra_info[macid] now, but for group addressed frames with a key,
>> rtl8xxxu_tx() replaces macid with the security CAM index, which can go
>> past the 16 entries of ra_info.
>=20
> RTL8188E_MAX_MAC_ID_NUM should be 64 (hal_spec->macid_num =3D 64 in
> hal/rtl8188e/rtl8188e_hal_init.c).
>=20
>>
>> This is what I use on top of v3 for 1-3:
>>
>> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net=
/wireless/realtek/rtl8xxxu/core.c
>> index 49c167fd6ee4..9a297b077443 100644
>> --- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
>> +++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
>> @@ -1154,6 +1154,14 @@ static void rtl8xxxu_start_tx_beacon(struct rtl8=
xxxu_priv *priv)
>>   	val8 |=3D EN_BCNQ_DL >> 16;
>>   	rtl8xxxu_write8(priv, REG_FWHW_TXQ_CTRL + 2, val8);
>>  =20
>> +	if (priv->rtl_chip =3D=3D RTL8188E) {
>> +		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0xff);
>> +		val8 =3D rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
>> +		val8 |=3D BIT(0);
>> +		rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 2, val8);
>> +		return;
>> +	}
>> +
>>   	rtl8xxxu_write8(priv, REG_TBTT_PROHIBIT + 1, 0x80);
>>   	val8 =3D rtl8xxxu_read8(priv, REG_TBTT_PROHIBIT + 2);
>>   	val8 &=3D 0xF0;
>> @@ -5572,7 +5580,7 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw, =
struct ieee80211_hdr *hdr,
>>   {
>>   	struct rtl8xxxu_priv *priv =3D hw->priv;
>>   	struct device *dev =3D &priv->udev->dev;
>> -	struct rtl8xxxu_ra_info *ra =3D &priv->ra_info[macid];
>> +	struct rtl8xxxu_ra_info *ra;
>>   	u8 *qc =3D ieee80211_get_qos_ctl(hdr);
>>   	u8 tid =3D qc[0] & IEEE80211_QOS_CTL_TID_MASK;
>>   	u32 rate =3D 0;
>> @@ -5580,6 +5588,10 @@ rtl8xxxu_fill_txdesc_v3(struct ieee80211_hw *hw,=
 struct ieee80211_hdr *hdr,
>>  =20
>>   	seq_number =3D IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
>>  =20
>> +	/* macid is the security CAM index for group addressed frames */
>> +	ra =3D &priv->ra_info[macid < RTL8188E_MAX_MAC_ID_NUM ? macid : 0];
>> +	tx_desc->txdw1 |=3D cpu_to_le32(macid & 0x3f);
>> +
>>   	if (ieee80211_is_data(hdr->frame_control)) {
>>   		rate =3D ra->decision_rate;
>>   		tx_desc->txdw5 =3D cpu_to_le32(rate);
>> @@ -7002,6 +7014,13 @@ static int rtl8xxxu_add_interface(struct ieee802=
11_hw *hw,
>>   		rtl8xxxu_write16(priv, REG_TSFTR_SYN_OFFSET, 0x7fff); /* ~32ms */
>>   		rtl8xxxu_write8(priv, REG_DUAL_TSF_RST, DUAL_TSF_RESET_TSF0);
>>  =20
>> +		/* The 8188e clears the beacon queue after each beacon unless told n=
ot to */
>> +		if (priv->rtl_chip =3D=3D RTL8188E) {
>> +			val8 =3D rtl8xxxu_read8(priv, REG_MBID_NUM);
>> +			val8 |=3D BIT(3) | BIT(4);
>> +			rtl8xxxu_write8(priv, REG_MBID_NUM, val8);
>> +		}
>> +
>>   		/* enable BCN0 function */
>>   		rtl8xxxu_write8(priv, REG_BEACON_CTRL,
>>   				BEACON_DISABLE_TSF_UPDATE |
>>
>> With these, beacon loss is 0.5-3.4 % at the sniffer and association
>> takes 0.5 s.
>>
>> 4. Duplicate pings. I can reproduce them with two clients, on one of
>> the two and in both directions, and not with one client. The captures
>> show the client sending the same MSDU again with a new sequence number
>> after its retry limit, because many of its frames are not acked: 62-73 =
%
>> of the frames sent to the 8188e carry the retry bit.
>>
>> This is not AP specific. With the 8188e as a station of an rtw88 AP,
>> same dongle, place and traffic, 63 % of the frames to the 8188e are
>> retries with rtl8xxxu and 0 % with Realtek's v5.3.9 driver
>> (aircrack-ng/rtl8188eus with kernel API fixes only, on a non-RT kernel;
>> it crashes on PREEMPT_RT). I dumped the registers of both
>> drivers while associated and wrote the vendor values into rtl8xxxu one
>> group at a time. The difference is REG_OFDM0_XA_AGC_CORE1:
>> rtl8xxxu_start() sets the IGI to 0x1e (see c8bc37602779 ("wifi:
>> rtl8xxxu: Simplify setting the initial gain")) and nothing changes it
>> later, while the vendor driver had 0x40 in that test. With IGI 0x40 alo=
ne the
>> retries drop to 1 %.
>>
>> A fixed value does not solve it, though. In AP mode with the two
>> clients at -44 and -52 dBm, IGI 0x40 removes the duplicates but loses
>> 35-65 % of the pings. The 8188e seems to need the vendor's dynamic
>> initial gain (IGI from the lowest station RSSI and the false alarm
>> count). Bitterblue, is there a reason rtl8xxxu has no DIG, or would a
>> simple one for the 8188e be acceptable?
>=20
> I think the reason is just that nobody implemented it yet.
>=20
>>
>> Georg, do you plan a v4? I can send 1-3 as patches on top of your
>> series, or include them in a v4 with your patches if you prefer.

As mentioned upfront, I only did minor changes and added some fixes
which came from the review, but not much. I have currently 5 patches
and can post them tomorrow:

[RFC PATCH 1/5] wifi: rtl8xxxu: move dynamic_tx_rpt_timing_counter
[RFC PATCH 2/5] wifi: rtl8xxxu: handle rate control for 8188e a per mac_id
[RFC PATCH 3/5] wifi: rtl8xxxu: update max report mac id on station add / =
remove for 8188e chips
[RFC PATCH 4/5] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
[RFC PATCH 5/5] wifi: rtl8xxxu: set mac id in rtl8xxxu_fill_txdesc_v3

Please feel free to take the patches and, if necessary, adjust them.

>> Best regards,
>> Mehmet
>=20

Best regards,
Georg

