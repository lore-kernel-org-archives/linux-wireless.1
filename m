Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685720;
	b=eQKgH4VNX8E1/U5l/eVlSlYu9MN1/5FOZTG+8Eki1QdYW7SDFYkj7ZhETobLjeFQk8nQ
	 vat36IQg6PlWWYY16Yn6bn9di16YE08T+h0kMmMTucoHa/WmjFj1z1KibV8d2mecZS1/h
	 ln9w/dDb6EoWaBGB8BZ+BkC1aDBkJL2LaGWnFrdmAJ0SXpa9UTGWoUlc8aN1KXS0NCoGX
	 A7KirUu+yZf1Om1ndr9ct5PO/u/VyMQokArw8lIqgpGG7oLpdu//GDnmLW8gQGi2p2/gA
	 HpMa+oVf7zCFxBmBep6KqTO3jCoSDVyPhZCNSLzN55hJ8e4oq3b7QV5xN2LNpSrhV6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685720;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=i93aHJcJ8x1HdwHppTrh/5V2kFRBPdGPq1RZ2aGENl8=;
	b=Dz/U67H3IdlcxYCHjX4ON7UjabzyZ6XgcH3QApm3OndUmQucEHRnVx3zkrlr3t5un8n1
	 +MJE5GzkVwm4fjYIdLyp1vaPTKBIYWALb7nwcaNmCbfs4MQK811Qs+qvleAu9CCEwvqCm
	 Jn7Z/XcEa6/gdExvsaCA9Rkei/+uhzfqfTmQtU7P0g7R416c3iNBi63Ctm0GgWW6bxXjc
	 sDQyIee2ctSREWN0qVon3I919q20tbxaW1kGRVFhYq99WLPr2sT0PD/T368F/kiLdHgJj
	 7hAbcT5QNmFtLL8qn//c67uxLvEH87Xq1yxKocVahW5qr724NXjFZbosZ2wn1VTbo9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DTanizoU;
	arc=none smtp.remote-ip=91.218.175.25
Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C3606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DTanizoU
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=i93aHJcJ8x1HdwHppTrh/5V2kFRBPdGPq1RZ2aGENl8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795685717; v=1; x=1796290517;
 b=DTanizoUa22optt8gmd+1CgDZB003ZdMJvc0a7TZfQj/JFJ6E9RpXKZRMMunjYp4VuR5tjLw
 Gs7iHWYNuEo2LDxkTqyjcFrKgRv7D60Qwpgh7n1XavM3sGZN0Y6CgyrL912aPNKPbB039qzjVQ8
 Z+DUFIKlA5HSINj5ZXIiPDso=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ce626ae0182f3ab;
	Thu, 26 Nov 2026 09:35:16 +0000
X-Mizu-Trace-ID: 6ce626ae0182f3ab
X-Migadu-Flow: FLOW_OUT
Date: Thu, 26 Nov 2026 10:35:10 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Ahmet Zeren <niko3x@proton.me>
CC: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFT_rtw-next_1/2=5D_wifi=3A_rtw88=3A_use?=
 =?US-ASCII?Q?_the_rate=2C_bandwidth_and_GI_of_injected_frames?=
In-Reply-To: <28ED0B12-9712-45BA-BF90-8D7392C5D504@linux.dev>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me> <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev> <ecNmU3PXiWoHo5Kp9n39tXmMq1iJCEzT2J_TrZH2xipIKP9jtEdDBIYUKdyBWvKCRLekdJgXgo50awp_oEjhE1KlfT6e1ELZT9abegQ85L0=@proton.me> <28ED0B12-9712-45BA-BF90-8D7392C5D504@linux.dev>
Message-ID: <D4FA00A3-DC56-4D4E-A03E-4DD4FCF11C94@linux.dev>
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

Hi Ahmet,

On November 25, 2026 11:55:20 PM GMT+01:00, Luka Gejak
<luka.gejak@linux.dev> wrote:
>On November 25, 2026 11:34:49 PM GMT+01:00, Ahmet Zeren <niko3x@proton.me>
>wrote:
>>
>>Hi Luka,
>>
>>Thanks for looking at it.
>>
>>> Do we also need DATA_SC when the requested width is narrower than the
>>> channel?
>>
>>You may be right, I'm not sure. rtw_set_channel_mac() writes
>>REG_DATA_SC on every channel change, with the 20 MHz primary and on an
>>80 MHz channel, the 40 MHz half that contains the primary; and the
>>normal rtw88 TX paths leave DATA_SC at zero. My guess is that the MAC
>>uses that register then, but I can't tell whether that still holds
>>with USE_RATE set without hardware.
>>
>>If you can run that test (a 40 MHz frame on an 80 MHz channel, with the
>>primary channel in each half), that would settle it. If it goes out on
>>the wrong half I'll add DATA_SC to the descriptor.
>>
>
>I will test it in the morning and let you know the results. I would hold
>off v2 until then.
>

I ran a test and the result supports your reading of REG_DATA_SC. Please
keep DATA SC at zero for v2.

Best regards,
Luka Gejak
