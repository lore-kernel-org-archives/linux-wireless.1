Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866791;
	b=QkhvIfenQnIWJ6AYL4/upqCQjQ0o0MaQeC482G20uOwaBdgQlgDCop1dOvwmyTtdYMon
	 1PnmTmLahCtkJmPh0ILuYiAzbV15mJJEHr5KQPKj4kyC2p2KNv068Z9N1ugBmIqXIjX1/
	 EqwIfkahERRIHfFkOJy8McAFc05mpNUFnG5gsXCpra79Thy/AjjdqF9K5/gbIbYgTcNCQ
	 0nkr3JFzgYH8/rv4m5IsPAhycBb4TFUdn7xfZvbLAwuaa5gjHtbJkHkYIbNlXvNPeJ658
	 o88Q2k6886bcWrUhjhCP44a0zF98PoiUN+4X9vB7PFGD79HG/X8SPmsf3xoBfPTAYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
	b=h/2IkbpQE/n/wKYLFjfPatnVjLXe8rQPLCQ3/+gvfsX3NdW9MjveeFKjh/KMkhe9/CqA
	 Kv5eONsMepbD0V+h9LulBtESL2I3KyomhEuHrM/OmiXwYDS1XGP5i/p9P+a3SF7frNgus
	 TgaKqoy8qMVUqBxzmDpcIua8AkKbb8DSQ/LXLQ4c1WdcnWPvtZUyqJoJPUNmDxjNIILfS
	 K4vgaMHrsepk9giogRzuHKRlmMkXcyjGRRADL26O5NLXxmnhFgCFC29l25M3nPBRUN5Rz
	 HTeQsZUM+ifHwkK7nYrV2+rYTnrdr8UcLQQhQjetfpBcrMBBveP2+kKx6tT9AuCdLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tRqyCcRF;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CB3606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 11:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CB3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tRqyCcRF
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1477398466b.3
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 03:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795866790; x=1796471590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
        b=tRqyCcRFf7CBNUBCPqXSGGm36NowlRg9q/fOGxYfec5E7TM1rCWj8Q6T8fP1ldsgPB
         2/YdjkBYzgck5fBgjBgxY+FYji/fCrb2eKNzexKtPM+a+nzEsFzTDwgXlgaAR5GCLqoq
         HSqLYfqNoECUnoHbvOjeGAAkDtWcUthyYY8XKONor1cdst/dM2KGAj6812ChqvJjxbWC
         rlWUoknR/9adVQAJ59k21qltG45wIDYyZNngynZam8TcQ0+IVPzeQKybs3ZfJLHZBCcu
         Nm2b+2uHYpozLxaj3l9OvIhHmZf7QF+Z/6hMqGQQWRbehx7uNzhN3SxCTUWX0BPQCZ1b
         3Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866790; x=1796471590;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aoRkbwvpEvdp5sy1ThoThAKb1QQYA2IMTxLgEF5n0s=;
        b=toF2bCXradzUmA4ctAd+hUE8QtWNp+Jpn5wDyYEBUoaGyJaVBqi74zB+nNJ1P62dQF
         tOsZ734XP6z64ueInkJOokVzn3Zlc6MkVM1/ZH0dbVc2YxmtEmqbYHoBoei0eD/gD0ow
         DjDyPo3OPGRZQ+eLt6xpQlpemLcM1Qq/5AZ+3Wf7hN7nTlNivmhcQV6BT9rcUeHUVAxG
         kpOSov59a/iHsfywB+M6820yoezCoaWH6ILjKkd5dDGQ+s+2CvLXEqxeyaLonEDuLlpI
         BksDgV6Jo3gARqhtVn8PyzCkd0iEjJMOwVVST2tYS1C+xpwnHFTG6NjWN0rrTMoTXDvs
         qFzw==
X-Forwarded-Encrypted: i=1; AL+hErE8HV95gdLYYWYLOvZdc3ud/mWyoES7KHKM+zlXiSBY8dYPdUdjOfTPAdRhQJby/2OxSdYjANG6oo3q/dx97g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9rSinaA+xfqz9q4ZTD6cIc2zXxHBDG6T8FPPCtvpMJkyTrbo3M
	GQa5X+se8bHQvuquYP2bSN2mYWAsv4yn6UyAjC8+7Z9u2C/qyOByDReUpzZdJgQJiA==
X-Gm-Gg: AZFdTZdX7VW4MeXwuZ31pcBfLZseLu1n+qqwQkWEz0mY3QBoz8eiyZ6PSJcv+f342AJ
	Cd/hab0Q3SCM1kvjwLuZ9yaDKy5rWUfrkEJn3a/4GM+C7X955xI4DX0k91Z0t6nFd/UnmCiz7A4
	vwoZVdkSpmz3sTKUC1ypbgFVWEMIPT8Zxkdd8dRRAEk8TPQlVJYvMp9vEDwDCNdznHqM3vm7lfd
	qtZn9Ok6imXArtGQx/QVJDXHmCJHSnl3recEOoz+o+NgHJnggxnjrimFNFodWvWWsExyrKcXYHZ
	IzlVDFdbZIodJIqIwVv5HhTVQ6FmToINsi8Kz6dyNSnusjQ4uAtzhiCrY9YShAslVr5ogGL5kk8
	MlPhdUn0gr5P6gARLg9xHRAVfPrwX16TlkxGuT7NHT2/MtzyBIvnAVsoaNtNGzDruYFQ/Z9iZtJ
	bvWvYkbtQCJAt7FL6o4tIySCfz9yCuPEhHMwhuBEYbvOWiu2aQ+bkjuSnXKknvpCXQwuSZXnqyQ
	lio6ynYdgMQEZeduOliw/UJcNRdLmRdwsj8+uQwo/ihYPfZN5wgGBcfHTORVvwZen47VN2ec6Dv
	mKJfgx7xuTJgPQPPksBSo+fJzw+MkdWsgVSOKKFP6YRNpGP6gjlHuVg95SN95JMdnoRzB7ngpnk
	n4ocAMVzy8M2bZtli3ra/W++LIaWLPqWCbwUhP6DkBfwR3XsxYI5NvEkbrne4JLg9e0RUSySqmQ
	uXS/As9lekg5oqK9z1odTScTjXiyNTyCOIbjC0kBgrqQFHauK69sa+lMghcNPnIACdgn4hzsbg4
	jNoURtvglj+c7Ecaue53gjprPwPRUcn+c39Ng+ZiG3qWZ91zOTEf5qkOfdY2rOF7mQ9ovmDUxz0
	f/DXHltDYrZei1gEgP497e4vqXAjgGBYHcw4RHN2X6eOLC5RMcXfXxnHpF3swwFhBWUWZCYpI4P
	1f8MKutX+jVZGuxwWRHcm
X-Received: by 2002:a17:907:6ea8:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c513a8069bcmr2557800266b.19.1795866789862;
        Sat, 28 Nov 2026 03:53:09 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470120008502fb937d9e134d.dip0.t-ipconnect.de. [2003:f2:4701:2000:8502:fb93:7d9e:134d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67bd3sm959587366b.27.2026.11.28.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:53:09 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: karthikeyan.periyasamy@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rameshkumar.sundaram@oss.qualcomm.com,
	baochen.qiang@oss.qualcomm.com,
	quic_cjhuang@quicinc.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	quic_bperumal@quicinc.com,
	kvalo@kernel.org,
	quic_pradeepc@quicinc.com
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source other than the station
Date: Sat, 28 Nov 2026 12:53:11 +0100
Message-ID: <20261128115312.428133-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
References: <20261122210809.2087836-1-julius@bairaktaris.de> <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/25/2026 2:26 PM, Karthikeyan Periyasamy wrote:
> Can you explain the test scenario ?

There is none: I have no ath12k hardware to test with.
Found by an LLM review (Claude) of the code, comparing the decap path
with ieee80211_amsdu_to_8023s(), which drops such a subframe.

> How the user trigger this issue ?

A station associated to an ath12k AP with Ethernet decap, without
4-address mode, sends a 3-address A-MSDU whose subframe header carries
another host's MAC address as source. If the hardware writes that
address into the decapped header, ath12k_dp_rx_h_undecap() sets
RX_FLAG_8023, ieee80211_rx_8023() delivers the frame under it, and the
bridge learns the other host on the Wi-Fi port (br_handle_frame_finish()),
so traffic for that host goes to the station.

Julius
