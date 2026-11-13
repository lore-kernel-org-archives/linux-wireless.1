Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559151;
	b=UmCUKF+FhMKvusWMmnEyVZg98NFH5CLx0NANtBLh5IoWNiCZ5nUTg+cd73CS0M2CD594
	 xZQ5VAo5t+2V+d2RvN49Ag92qAhRGBkiQO+YuqPTllLZcWeDqAZtNg5mKv9rZ0njAMeid
	 uIMPxAq3R52l2BPvxki72dALITttDIFPnbaRA1UkQepx1Ya03jF/r6e8DVK7ME82ILb9Z
	 gC2ai3ExA/KWZFh/DU09qbee/ypYxIlny3VtRSRgwF8FeVD4Ah0eIlTswYfnHohlsGWwl
	 T/oLGJHZTuk+2tlvQBJGD2msN2C2wgWFfUGxyr01VAd36L83EmzEcSYloYvuCMTMY5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559151;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1r0OgxKizKImcA/Ft8uKBN3WYC6jGc6YEeV4L0Lb72k=;
	b=mWlaY8luaR2w5eVXiyP4i81NvcSUIsDCHEwuR7LCXv8lXxZNJnMLAQUszrG88WCOaUtX
	 2kFNdEsMjLm+sPHFBrWxZNQ8lAxdgZrDR8KJtYgtoT6/y1Bepl4zuF90FooMq1BTBayy6
	 f87sDW30UqY4XVumtonxLxwA+jo/WyQw9x5Q8nZlaOyMfh95fUQ4h5NCCEmMp23lAqNvk
	 R5ELTxN8PjBbGDgnrFXbCe6d9Ihr1vCxm3rk7dA8hGSrYsooBJZ9z2xWpC8ipc9FMRDt/
	 Ldw1KgzIRp9bR873j2jvBvgDsr+WHiL2ROCccVMm6eIdsgpW0vA3GLRo8sbnBVvKESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RxrlZ5so;
	arc=none smtp.remote-ip=95.215.58.16
Received: from mta1.migadu.com (out-16.mta1.migadu.com [95.215.58.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C8606A336
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792C8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RxrlZ5so
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IwsEcXCXpDBtVOqX95LYubK4Dq7YpA/j6PRlrfIU4xQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794559147; v=1; x=1795163947;
 b=RxrlZ5soRKeBu6a9iMuGQgznL+mB40qoeBhCcbuu6ckfJaGFx6wjz8oC8FQspoDZzPZPAiPn
 QtRWvVSbBvN/ITD0RWrkis1crxkrmkCnL/xESqdwTrHj8zFN13g2dKr+HniMkvaHhM6y2MNUCIt
 8C6WjPQTpEY8LWL97EGUvNQM=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9518f2913e5d6754;
	Fri, 13 Nov 2026 08:39:07 +0000
X-Mizu-Trace-ID: 9518f2913e5d6754
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:39:01 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_5/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <CABOQOSUj9R1qHJh5M=TBi8Mn2YP68cuYns93R8jS0qK8FXZC0Q@mail.gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-6-hjf3108@gmail.com> <83327241-2EE9-4F4E-8770-4C422D0430B7@linux.dev> <CABOQOSUj9R1qHJh5M=TBi8Mn2YP68cuYns93R8jS0qK8FXZC0Q@mail.gmail.com>
Message-ID: <52B548C9-3F5A-424E-B523-E8D51CFD8000@linux.dev>
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

On November 13, 2026 9:16:33 AM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Fri, 13 Nov 2026 at 16:10, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Jie Feng,
>>
>> Thanks for the patch. One small question below.
>>
>> On November 12, 2026 6:32:44 PM GMT+01:00, Ho Jie Feng
><hjf3108@gmail.com>
>> wrote:
>>
>> > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > index c8008cf43d..c8f5cdf31c 100644
>> > --- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>> > +++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
>>
>> [ ... ]
>>
>> > +static void rtw8812a_set_ampdu_factor(struct rtw_dev *rtwdev, u8
>factor)
>> > +{
>> > +     factor = min_t(u8, factor, IEEE80211_VHT_MAX_AMPDU_128K);
>> > +
>> > +     rtw_write32(rtwdev, REG_AMPDU_MAX_LENGTH,
>> > +                 ((8192 << factor) - 1) | BIT(31));
>> > +}
>>
>> What does BIT(31) do here? I see the vendor driver sets it too, so I
>> think it is right, but a define in reg.h or a short comment would make
>> it easier to follow. The same goes for rtw8821a_set_ampdu_factor().
>I reviewed it again and saw it, so I added it to be at parity with the
>vendor code.
>

Can you add a define in reg.h or a short comment, as that would make it
more readable?

Best regards,
Luka Gejak
