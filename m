Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994452;
	b=GwdmM3yausWImNcaDiR20TDMlm7X/fKY7qpsRGlKr8pLB3NdTWlZBVJrA7YXkZXucT31
	 KPJiTVCSfIoIT574vypRzISjhw2Ae8oVtRo7h8YC85SJNOeMBzKxxrHWOrkJ+gHSNX+Ym
	 fT2cWTyVkfUKzuiOoWIiClwL1FZK4bMMm4e9RimDwxhloivKhgBtEs9GT9ZlwAu5SYq5q
	 Ot7ZWi/p+SRgZZ/EDNkYnFacdoiZ0wtyb6eO3SNXIpm744foPoSZxzhv/QQpsbfXcg3Fo
	 +/9QwUrR6xJ6E8uId4tK+UHbX8BLYTBRbqzqK6kXQw98x1IHWff/dLI19RCOtt7LEFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994452;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=lkbxTIFmAXqjICNU3+0GmZcR0h4hLPWaj27ZmmQeUto=;
	b=sAitURk4z5eE7pm4Hnm2GB9ouSiWsJaL4iEGSmr4z30vE7cztcEimamx4si/KbXiZjmM
	 QEX17tIst7CDJlKuxCc/G3NvAQT8dSWBbL+kwQUI0TUlxCoXBiYB4QwDakyNl7GJcBQ5a
	 OoCLmkM467kqbSVfdn7R3woknDq/Ym5yk1wmwkeyjebJbLkpDRUCoX+wgX9uDjNAdJGQV
	 A+M9SiMY7ti6XghjItIGzaesGmuebeHIaOAnmpkt7wwPpUvX3bimiLsJZUf0MUEkcifLs
	 xniWMlddjiIudteGwqQuWdBdSW5IQYKUHh6Mql5tjJyxzhXvfER+tBPhq9xwC45rzYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=ZalWSfdA;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E31606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 09:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E31606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=ZalWSfdA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lkbxTIFmAXqjICNU3+0GmZcR0h4hLPWaj27ZmmQeUto=; b=ZalWSfdAojDjIlUflBgylTlWAa
	GiYMCPD/eX5Lff+m34YSBI1G+ZttziEnGWOJfPaQcmJbxkiN+h1UiJvjA2jYpUKk3lMuShdpFqTD0
	YeG6XMcSoDontvcyUCBKwtHFlrl6DVAwyURU0bw1HSmTlpa23UENrlch13c1Xd1i6i/A=;
Received: from p54a4360c.dip0.t-ipconnect.de ([84.164.54.12] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTc3O-004wbP-0f;
	Wed, 18 Nov 2026 10:34:10 +0100
Message-ID: <81acd946-dc4c-4fa4-81a7-4df0b7cb06f2@nbd.name>
Date: Wed, 18 Nov 2026 10:34:09 +0100
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
Subject: Re: [PATCH mt76-next 09/19] wifi: mt76: find the first A-MSDU
 subframe behind the radiotap data
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org
References: <20261117180134.2940930-1-nbd@nbd.name>
 <20261117180134.2940930-9-nbd@nbd.name> <av1lP1f9hczy7jt2@lore-qca>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <av1lP1f9hczy7jt2@lore-qca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.11.26 09:43, Lorenzo Bianconi wrote:
>> mt76_rx_release_amsdu() reads the first subframe relative to
>> skb->data, which points to the radiotap data where the driver pushed HE
>> fields or EHT TLVs. It then misses an RFC1042 header in place of the
>> destination address, so an A-MSDU of an HE or EHT PPDU in 802.11 format
>> passes the mitigation of CVE-2020-24588.
>> 
>> Locate the subframe behind the header that mt76_skb_get_hdr() returns.
>> 
>> Fixes: 2c2bdd2372af ("mt76: validate rx A-MSDU subframes")
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mac80211.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
>> index bd822193e769..271fbd4711f7 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
>> @@ -965,18 +965,21 @@ static void mt76_rx_release_amsdu(struct mt76_phy *phy, enum mt76_rxq_id q)
>>  	 * address.
>>  	 */
>>  	if (skb_shinfo(skb)->frag_list) {
>> -		int offset = 0;
>> +		u8 *subframe = skb->data;
>>  
>>  		if (!(status->flag & RX_FLAG_8023)) {
>> -			offset = ieee80211_get_hdrlen_from_skb(skb);
>> +			struct ieee80211_hdr *hdr = mt76_skb_get_hdr(skb);
>> +
>> +			subframe = (u8 *)hdr +
>> +				   ieee80211_hdrlen(hdr->frame_control);
>>  
>>  			if ((status->flag &
>>  			     (RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED)) ==
>>  			    RX_FLAG_DECRYPTED)
>> -				offset += 8;
>> +				subframe += 8;
>>  		}
>>  
>> -		if (ether_addr_equal(skb->data + offset, rfc1042_header)) {
>> +		if (ether_addr_equal(subframe, rfc1042_header)) {
> 
> maybe I am too paranoic, but should we check this is part of the skb head
> running pskb_may_pull()? Otherwise I am fine with the patch.
This is only called for hw-deaggregated A-MSDU subframes, and each 
subframe has its own buffer. Even if the hardware were to misbehave and 
pass a truncated subframe here, the pointer would still be much closer 
to the start of the buffer than the end, and never overflow.

- Felix
