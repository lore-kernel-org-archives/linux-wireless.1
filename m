Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795482327;
	b=5WFbdLb2XqnqHBB5QUQu6oFxKk9j79TreRzWYmnsccw/gKyZ17VxLkJmOH15sJ3VRtAE
	 Z7eFuvRrFEUfklChWNpVzC2DVtSwdWpXa1jORVxJbe2XM7jLO097rZXywY0npMaGub4/B
	 7PsQvxqlZCLYehRdajAonz3wfwRuM3WjiMQvcDNSRo7dAihS9XBH725CVrUA4YzXHq3PN
	 eCE6cpFKIwmhoJIp2tKQMuqqtIvxw+T7R693whyYljjx1S9X+j6AOBSzL2f4bxodlC6zn
	 6smpAl7UAkRB7KQcvnTYSitm3HglTGA7K24XWLTxXevD6woeIjGNLj5tRBkRyg2x54g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795482327;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GD+nrSD9UDlCt+TnamTi3gK8R4+8GMgsa7LfEotVLq0=;
	b=O7aWWrvYr5UCGX1Z93+nGPTo0/JRZmfYchjpWiE77FtxDG/fYbEFZQUEIMmxGZXyBwzg
	 fFVDALitESs8vGnduIIVDqQqd9TdOmz0U/9KWUfllW1fiWPCh0ksxi/xU+e5WlCDC/Rh9
	 FjCbOn/pDnSj/NAyDW5OdCisvUyOlX2aPqmtMPJmECohm+10i/1dzdkcas4u634faquBG
	 wy+rXqT4pRg1wKR0Wftn4LdSV+Wpnu0njsT24vGlIbyKLQpz9Mb6JckS8B8sFmWV/12O9
	 CFKDAmK7Hp4ycYyFfH+YEnWkE1Erw/vfcEgJri2b1ROQ/Ai/6YdcPA2g9MQBFWI4Jfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RyuEGRhZ;
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E4E606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 01:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RyuEGRhZ
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oVnsqeWTQOVkNl/6goetfrdSal8OscM8f7MeuYsDjx4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795482324; v=1; x=1796087124;
 b=RyuEGRhZlxOtg2Eb++zXOzrM4JWJhOwa/WoBbK9UV+FkGXr07bv4FkoXoeluRsIvCU3tOrxt
 aQDIloQYFGVMiYpZRAmlqCbd6rflfUWym9Jqlmn27j2na5qDypEGMaeXK8tfP9aRDDEzzxgn6oz
 Kkkq0k5TCeqcolHUmBo6t3D8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3dc90ba5493616a;
	Tue, 24 Nov 2026 01:05:23 +0000
X-Mizu-Trace-ID: b3dc90ba5493616a
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 02:05:20 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, niko3x <niko3x@proton.me>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: RE: rtw88: injected frames ignore radiotap rate and retry count
In-Reply-To: <89e27a6cf5e64dde82f4fa7e2ac4f15b@realtek.com>
References: <sz_DHzKsOepyz69cMCgwtDkF_KWzFDHlbuRsiUI4mOjDDIL1G4JvoK43-NbdZqQmfxQhtIqH5sMQpPQ5wfwYMrg6oDx2mlJ-x_rlqNB-pJg=@proton.me> <89e27a6cf5e64dde82f4fa7e2ac4f15b@realtek.com>
Message-ID: <00FE12E5-FC3C-4B8B-A5CA-251C61A20990@linux.dev>
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

On November 24, 2026 1:52:49 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>// +Luka
>
>niko3x <niko3x@proton.me> wrote:
>> Hi Ping-Ke,
>> 
>> Thanks for taking the rtl8xxxu injection and TX status patches.
>> 
>> Looking at the other Realtek drivers, rtw88 seems to have the same gaps
>> rtl8xxxu had. This is from reading the code, I haven't tested it:
>> 
>> - the radiotap rate of injected frames is not used, so the firmware rate
>>   adaptation picks the rate
>> - max_rate_tries is not set, so mac80211 clamps the radiotap retry count
>>   of injected frames to zero
>> - the requested bandwidth of injected frames is not used
>> 
>> rtw89 got this recently in e96abe4fd7c ("wifi: rtw89: consider data
>> rate/bandwidth/GI for injected packets") and 92608bb5f14 ("wifi: rtw89:
>> honor ASSIGN_SEQ, retries, and NO_ACK for injected frames").
>> 
>> Would you take similar patches for rtw88? 
>
>Sure.
>
>> I don't have rtw88 hardware,
>> but I can write them following the rtl8xxxu and rtw89 changes. Could
>you,
>> or someone else with an rtw88 chip, test them? 
>
>I Cc'd Luka. Bitterblue and Luka are active with rtw88, so I think they
>can help this. 
>

Of course, happy to help.

Best regards,
Luka Gejak
