Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163071;
	b=z+b+2GktG0DZ5WmPCyZ/FZeo53wsJPRGbJoVA7hawJbyob2VDlf6RYwl/KYXSjo3x4S4
	 N4yyTAD8X1XkiScZJA899LSlLDxviDu6/DEF8c3fXdNFd6e+JWVRl8zMbv3RBd5B6u1k3
	 SQn3maoanUBFJcExJkr8R74CgxvyEFLTYlAZfPI514S229eFlnKFIxPaxreBslt6HhUMd
	 TFdZmray67L+YyCPSp2zbnIZzmtnc5Mz4j8ACzkXXKTIuzF5V3FmVXcHgdF47SzBXTCVE
	 qrIXl1OHEEG8ft00dL50legVZKbqUNGp5c7LlPhnJcpRPkGX7DD3RsFKe+aFK7cEzoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163071;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TVhqHj4b/4yJzMbCX+4Vp5uwHBdGbT6mxVN1GiCIdAk=;
	b=jC7TaYQi3QFpaTkAOlYFaFgSMYksBa64gwjmTsRX0MkFZJ/8mgM/etSlHiJDVX6pwOS3
	 zZWPvJKXkFGMkcVRRHZ523MYVG/aNwG0z7GwmmzuCCg2oQgQohQ/tFh9lLCjlZtCXEoxH
	 pBxR2UmKfM5V1pbrPX0SoZk9+mcmpiTl7qiOTfX1u4uRTTPxZ2moJqpAC02rp+fxKWS6f
	 mbDxE74kKnX5EURh9S9IE9SQMg7Sur5EbwMnUyRBtMwzowOvBAJh2CwrG0Bn0/lh2lT/8
	 GY/3sginCHs8pte+YpYgohTFGdAUomD+vmarVMv0uOROr0RYm2s/XSecrTFnqw+Q1QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=LkCZd4aq;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC3606A339
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 08:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CC3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=LkCZd4aq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TVhqHj4b/4yJzMbCX+4Vp5uwHBdGbT6mxVN1GiCIdAk=; b=LkCZd4aqqwsW01mziztNbpMrTq
	7eAdoAIpFUNvBIU0OJC/mCdwHbBhVMcN+M1EQugkaZlWCJLXeXyaAy+AZ3VLPRGLTbg9UPsV5iFJd
	8leBY3S/Q/XYq0V29Igb3Nnn21bAKKjwmZuzmyir6CkMnE97EyMo6O1qkhS42TWdre2Q=;
Received: from p54a4360c.dip0.t-ipconnect.de ([84.164.54.12] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUJv0-005tL7-2Q;
	Fri, 20 Nov 2026 09:24:26 +0100
Message-ID: <c28aba9d-9401-4834-8d45-b0156012a670@nbd.name>
Date: Fri, 20 Nov 2026 09:24:26 +0100
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
To: Michael Shih <michael.shih@mediatek.com>, lorenzo@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kun.wu@mediatek.com, deren.wu@mediatek.com, sean.wang@mediatek.com,
 quan.zhou@mediatek.com, ryder.lee@mediatek.com, leon.yen@mediatek.com,
 litien.chang@mediatek.com, jb.tsai@mediatek.com, eason.Lai@mediatek.com
References: <20261118010310.1044193-1-michael.shih@mediatek.com>
 <20261118011758.1049815-1-michael.shih@mediatek.com>
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
In-Reply-To: <20261118011758.1049815-1-michael.shih@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18.11.26 02:17, Michael Shih wrote:
> Customer request MTK to support OUI for wpa supplicant.
> 
> Signed-off-by: Michael Shih <michael.shih@mediatek.com>
What is this supposed to be used for?

Thanks,

- Felix
