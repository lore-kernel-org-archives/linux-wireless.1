Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308335;
	b=iZ7wt/+57UaVJoACK+V/rHWy9S/EV7eBhEpPEdGKlrtHoieqZEaIxwjpcUHqwoI9C3GR
	 0pn1h+Ctc7r/YXYJAwh/KSfhuVZkISe37wxi4VaUNKH06JTFMS89w9JgfLsM93JvydTrg
	 oTr6law4ptf83WNB1KI2nineiZ8UbGS9Pp19y1X9zX86RvAXaeMjJp9wzrmo+DyDN3Wg1
	 9jeHqJoqOwY3gRjngwB8qeadAUt5Feu0ByHDd6yucWTc6OENwwBJQbGc/nwqGqCfV5Uy8
	 Za5M85t7hgXjQvyo7UHphe/ElTZch35uEqG3k/YU33ZYswGo4icXCitQUuV/sRLSW6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308335;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9+cfnD1cvx4mvbaOEKJUoBpDP5xW8TDSkQR3+VWyZUw=;
	b=ECQaVn9LzZDdwBPkFL+6gvN8JVUdiUj6Nuo1v1iwRLu50n4L9hcH5K0B4VRqOkQRkEDb
	 CWHtZVukWdEIJeBOtoNpSFvMcbOn+5lWIjk5rXkOhSVdeV7dYexd41n1FrRxXuPlLR6kY
	 Wx6H7FQH9a1wPkd2Jx/grA4HH8fwRlgBNG9wvBmWt5BG095CESGjgcxYFiSU3QLG5yC5x
	 8DAVS1z/3dEn97rgKwLXd4uiXlnCUAcmYbEQQCrTeJdHJtaMwJeMMSIO1PpXp/fVyzsiJ
	 QLmN+S546zVVz/OoaDPQARg77mupwxpQudpLP/t1HleaivNTTAFo/V65pWJUBQ/8WaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="W/PCDVKI";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B6C606A321
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 10:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=W/PCDVKI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9+cfnD1cvx4mvbaOEKJUoBpDP5xW8TDSkQR3+VWyZUw=; b=W/PCDVKIQXe7y2JowS8e5VW56x
	pCv/eXMy7IHpWOk02+ZU57nI2QxQ8dV0K46VxLj2ZH/doVOMD72z/XFLDTbKkqQH/qVBF+Z0VPMRM
	93Le944iFYYSfzkQQdoAiM7HLibU46TXBcw6ct65D1dwRSJr9ef6Rzol3mSSip5t0U2Q=;
Received: from p200300cadf129200f82573686eda1935.dip0.t-ipconnect.de ([2003:ca:df12:9200:f825:7368:6eda:1935] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xQjYt-0014cL-0v;
	Tue, 10 Nov 2026 11:58:47 +0100
Message-ID: <f0c94aed-3218-46d6-a918-19879348c2b4@nbd.name>
Date: Tue, 10 Nov 2026 11:58:46 +0100
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
Subject: Re: [PATCH wireless 1/4] wifi: mac80211: keep the monitor chanreq
 empty without a channel
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
References: <20261106154648.1228594-1-nbd@nbd.name>
 <12bec15dfdd9152ee450076a45c00679b9cd5d08.camel@sipsolutions.net>
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
In-Reply-To: <12bec15dfdd9152ee450076a45c00679b9cd5d08.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.11.26 10:57, Johannes Berg wrote:
> On Fri, 2026-11-06 at 16:46 +0100, Felix Fietkau wrote:
>> +++ b/net/mac80211/cfg.c
>> @@ -1165,8 +1165,12 @@ static int ieee80211_set_monitor_channel(struct wiphy *wiphy,
>>  	ieee80211_link_release_channel(&sdata->deflink);
>>  	ret = ieee80211_link_use_channel(&sdata->deflink, &chanreq,
>>  					 IEEE80211_CHANCTX_SHARED);
>> -	if (ret)
>> +	if (ret) {
>> +		if (ieee80211_hw_check(&local->hw, NO_VIRTUAL_MONITOR))
>> +			memset(&sdata->vif.bss_conf.chanreq, 0,
>> +			       sizeof(sdata->vif.bss_conf.chanreq));
>>  		return ret;
> 
> I don't think I see why this is conditional, and other places not? We
> _did_ release the channel after all.
Right. I had both conditional before, decided to drop the condition and 
accidentally lost the second part of the change. Will send v2.

- Felix
