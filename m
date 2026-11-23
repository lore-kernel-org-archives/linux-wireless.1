Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423544;
	b=BHJV3LM1TE8O6ft+7yduQIKiT3bJV3dbpeSBgGf+B6IhBBTL8ZmnAI/Rkot0qxE7hFbk
	 ciA/CKY+sqnpsBC3IQEO8rgBRvmq2ia+CJaxmPH8OpWeQtpvBL8x5bL0pgwbpi1rpSbOF
	 HOiUYM0pvrjgZ7MuwelR7XGbzZWHs/y3/S/R8gbgJ/OhtwDQ5XKiBZ8g+izrzl18TwmZI
	 XArd+RdoK8Misf/56pnyvZYuvLy+eM0LSvrrfg0dgX7x2xYpTWoPMLXVmbl9+O0FHQPl/
	 4sFVR4jk6geGYGD1TXwgQAwH4cHgmIlwi6RBm7TdfwvwG69oN7yjMbNer+CiyLk3WKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423544;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y3QMdMpFMgK3EVjAqDcg1fG0QoSWT2UZUwUtf9p9kOg=;
	b=jDXyysSp/nGFDRXfn2K1k5jT0uJrEZnAX6F9OyDpIZ5AT3AyO+RUExilOfrab5xiBkNi
	 1auyNlFQ/OyTsPVz+EusLcoMXx8VCJbA5noQaFmtkQVSFrNdVO6Bamx3CwsdIo1AyJVf7
	 xkXhpDyZ+HPzQ6FDNEhd1v1ipudV5BA7vY5pUQEzV5K64/BL+DPU1eQTmPRthckk4ADba
	 LFsT2skX2DlH5iELfLYdIldoEfnlnajqVDQdPQqK+LJsheM7QISmdj7eCpREPNKVGafRL
	 XdZeWNfs4dmPVVD+WqpVVl0Wc80YtHX5Lc4CCYeSW4pif9I7BazB9hfYcasTmLLTPlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=V2XcBbaq;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF53C606A31A;
	Mon, 23 Nov 2026 08:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF53C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=V2XcBbaq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y3QMdMpFMgK3EVjAqDcg1fG0QoSWT2UZUwUtf9p9kOg=; b=V2XcBbaqiu+zVbkJ3aMarZfrc/
	Art2r0nG/3M06RGVTab7OgNEW/MlRg6uQ9DqR1obga3EOcftHG2vfeb//QqYH2oYiTa/7gR2TecNy
	svdX2uvlQz6N+ANineBDjNbo0MSoDtq69tfzVklOTqVqkKADYDri8PLu7ieDThhA6xRc=;
Received: from p54a43aa5.dip0.t-ipconnect.de ([84.164.58.165] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVPfz-007Fz9-1F;
	Mon, 23 Nov 2026 09:45:27 +0100
Message-ID: <8d674f7c-68db-474f-8cb1-5645542db0ac@nbd.name>
Date: Mon, 23 Nov 2026 09:45:26 +0100
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
Subject: Re: [PATCH wireless-next] wifi: mac80211: find the station of a freed
 802.3 frame for AQL
To: Julius Bairaktaris <julius@bairaktaris.de>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Crispin <john@phrozen.org>,
 Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
References: <20261122150541.3117507-1-julius@bairaktaris.de>
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
In-Reply-To: <20261122150541.3117507-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.11.26 16:05, Julius Bairaktaris wrote:
> ieee80211_report_used_skb() returns a frame's pending airtime to the
> station found from the 802.11 header. An encap offloaded frame starts
> with its 802.3 header instead, so the lookup finds no station, the
> station keeps the charge, and once its leaked airtime exceeds its limit
> ieee80211_txq_airtime_check() stops scheduling it until it reassociates.
> Drivers with AQL and encap offload reach this through
> ieee80211_free_txskb() wherever they drop a frame without knowing its
> station, for example when firmware recovery returns the frames it held.
> 
> Look up an encap offloaded frame's station with
> ieee80211_lookup_ra_sta(), as ieee80211_subif_start_xmit_8023() did on
> transmit.
> 
> Fixes: 50ff477a8639 ("mac80211: add 802.11 encapsulation offloading support")
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
I think this is the wrong approach. The driver reporting tx status for 
802.3 frames without a station pointer cannot possibly work in 4 address 
mode (since the Ethernet addresses do not identify the sta).
Please fix the driver instead to keep track of the sta and pass it to 
mac80211 on tx status. This has the extra benefit of being more 
efficient by avoiding an extra lookup.

- Felix
