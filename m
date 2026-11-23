Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423624;
	b=DxtBTJmfuv5Ko2MpYtR6qV8y8udYisjmTZClseFYxoVCVnMY1dAtCCCaUeJhbV/XHtMQ
	 KQINgpbT4eK592NVlt1Mihk2pJ3kvaldTGyaStjLB+13VTDZ/nN0xppkttX6hA6fng/QO
	 5AE+zoYrjGIDibOKfkEFkI/5AUAdPVkJ8N5wh+UQROjqtmAQAwi1sON1Z0eGazQX5PBVG
	 K6XJbRnKCA+SU9XCtmd9ZhnNe1mRwiyw3drzrluByYe6kl7aNpo3KtFqeYqhlcgVdjrHa
	 jWIHR0QSiUbM7uO+X/ObOTqU2dONtGmd/k8QcZ6dNYoYRfa5zhH8o5eUCH+PyLHBGkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423624;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=q9Z3O6yfcgBjQ7vEhYrAXsXPQNhY9aYapqQ3cuQVdvo=;
	b=KtAWiP5Nj5CBou3lEbXAv1cz3E6NQjtnhsOVXU3qch9O8nKTcTmjaEIWKWcRdOycZA/7
	 xC1zpIF2adK2Tcs0yJyN4f+vieNG2VAa+ieQ4IXLi+gfpyGCR975aYYJo/UnWEZCIIJc1
	 u2ltQWNHRgY9linZjjFZh/+RNUsbbMv92mtmUECSJ9Go8ani08maPj/B7v81re6LkBoSZ
	 zc3eGWLqiQbc2rtqgbw34JHh+GUPf8E2NYitd3BpIerxNr0IPGpWfRA21pkbw29H862KC
	 DdJ/INhIq4ibYp4g00AafFDP1pr43Ath0mcOFuKrW5jLovlojjKeLiiPkdLok/ztUTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Z58J3fSK;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D4606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 08:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Z58J3fSK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q9Z3O6yfcgBjQ7vEhYrAXsXPQNhY9aYapqQ3cuQVdvo=; b=Z58J3fSK+nPEshfA+XJ8phby3w
	eSqBaqmbtmUW9nsSODph9SIw/LwOFv6RPe1dJwONv19njP2B/8nGlgUQtzcNanBJOV1NsoMv0+yEJ
	7gJBHJUyLSr5DWpWfouwHEDulohJwaSDyRWTlgMFho6DBZjePM+r4IkQZpDHbo5bhcU8=;
Received: from p54a43aa5.dip0.t-ipconnect.de ([84.164.58.165] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVPhU-007G1G-01;
	Mon, 23 Nov 2026 09:47:00 +0100
Message-ID: <2712203a-9b38-476e-80fa-b0c8f222e01c@nbd.name>
Date: Mon, 23 Nov 2026 09:46:59 +0100
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
Subject: Re: [PATCH v3] wifi: mt76: mt7928: Add MTK OUI support for nl80211
 (ALOS support for wpa_supplicant to get MTK OUI)
To: =?UTF-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: =?UTF-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>,
 =?UTF-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>,
 Ryder Lee <Ryder.Lee@mediatek.com>, =?UTF-8?B?UXVhbiBaaG91ICjlkajlhagp?=
 <Quan.Zhou@mediatek.com>, =?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
 <Deren.Wu@mediatek.com>, =?UTF-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?=
 <Litien.Chang@mediatek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, =?UTF-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?=
 <Leon.Yen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
References: <20261118010310.1044193-1-michael.shih@mediatek.com>
 <20261118011758.1049815-1-michael.shih@mediatek.com>
 <c28aba9d-9401-4834-8d45-b0156012a670@nbd.name>
 <5a8a96eece9925010a7bb4d9f7657afd2c0e15e6.camel@mediatek.com>
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
In-Reply-To: <5a8a96eece9925010a7bb4d9f7657afd2c0e15e6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michael,

What functionality sits behind this call, and is it something that might 
be worth implementing through a proper nl80211 API?

Thanks,

- Felix

On 23.11.26 00:49, Michael Shih (史君仲) wrote:
> Hi Felix,
> This is a driver patch that supports advertising MediaTek OUI vendor
> command in the mt76 driver for WPA supplicant.
> This support feature will only be triggered intentionally.
> 
> Therefore, I have added build flag in Kconfig so that it will not be
> enabled in upstream if not required, it is supposed to be used in
> Android platforms.
> 
> I hope this will clarify your question.
> 
> Thanks,
> Michael.
> 
>> Hi,
>> 
>> On 18.11.26 02:17, Michael Shih wrote:
>> > Customer request MTK to support OUI for wpa supplicant.
>> > 
>> > Signed-off-by: Michael Shih <michael.shih@mediatek.com>
>> What is this supposed to be used for?
>> 
>> Thanks,
>> 
>> - Felix

