Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297816;
	b=uGos3WLeulT6RWZ8wW66MFpctB7oCdLQeFESwlLJlz/PkZaNseYc3LKENuEd9ydmYA19
	 /2AsiTjieQ2yLgb0abAZCKBPy0PMf7m1PfuAkvOaltQlr+HFNQbYNiYtzkSq3wTJuqFNk
	 MGXTEZi3s3qzZrE2BD2phrPtJd3Cc0jJ5elMHnHMrq2/rgUiN/V4eyxYs0EKAzg2y3F+/
	 7xVtXcDu/90jBz5E8ah3IH2Ok3aqI5gL1G2tFCchsanfS3FNgiQ8+w/eleC81FxwHJOCS
	 NM6TXYvltI8BGPsB2jkmie/Sg6sQeZ3J6xsHf3YLUhOddqmHWbNsMxNNTVuGpfsL9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297816;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=NrbrkTC2383GltJ1/xG4oH1O553yahkSqfqhr2B0KUg=;
	b=drjzZQxGBOdG4vCrhVz1WhC6+632IJFgxOho40ZDc/S7X7ZdyYS1CozKsKukyIcvgrxS
	 vARLywIRuNeuWpYZeQgPMOxNtqGHnEGbiXpWKQiEaD0eyghEAJ9B9ZI/k2U3XDP2+cT7S
	 xg+hraNls4hfjc6ssDMusyJLlw2seidTjE+sRCybrK0bUEw4wDCQvGFisB44TPaSNAA4U
	 /3GE/eR+KnwZy2tfIA3x0ZAzYOpkn70Q1WROA0ybyRSAdH5p6khB0rgBSMKmWYhbGWDID
	 X9ajD5R/k9T+kGq9+MghYeQECC2ocxj4bw5J9llVHDfQtYvFrWbFEMPGWLIPhEBGYwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n02yaWlh;
	arc=none smtp.remote-ip=91.218.175.238
Received: from mta0.migadu.com (out-238.mta0.migadu.com [91.218.175.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B392606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 08:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B392606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n02yaWlh
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4PqXM7l4Ikpi6si9gMQ2qVSYh50Pe5p7W8oNd9axTUQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794297813; v=1; x=1794902613;
 b=n02yaWlhADnGFdmjnc8VO1hrse+03PJhsc2JgLneyCO+yqNua9bjueaomm5+fuQnxo9vAvTh
 1w1E55MxhoTPAewhDIPXlUDS12wRuLMYAC94PBMdIWJEvrDibjVE+c2WPesa333QYyeUvkS9qSt
 CZvP3evbcvetLqcd/EkaKMp0=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3eac155489b98e25;
	Tue, 10 Nov 2026 08:03:33 +0000
X-Mizu-Trace-ID: 3eac155489b98e25
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 09:03:30 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_5/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261109134046.953116-1-hjf3108@gmail.com>
References: <05823fa0-08a8-4805-86c8-8f74af8f1a95@gmail.com> <20261109134046.953116-1-hjf3108@gmail.com>
Message-ID: <8B293150-B4BF-429A-B9E4-831E38D28572@linux.dev>
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

On November 9, 2026 2:39:16 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>On Fri, Nov 06, 2026 at 07:59:44PM +0000, Bitterblue Smith wrote:
>> On 06/11/2026 19:27, Luka Gejak wrote:
>>> The 6 bit limit now shows up as 0x3F or 0x3f in five places across
>>> rtw88xxa.c and rtw8814a.c. Maybe a define in rtw88xxa.h, which
>>> rtw8814a.c includes too, similar to XCAP_MASK in rtw8822c.h.
>>>
>>
>> This is the limit for every supported chip except RTL8822C. It can
>> go somewhere in the core files.
>
>Since this patch is 88xxa focused, I feel that it could be placed
>within rtw88xxa.h for the time being. Since the cfo chip helpers
>will be promoted to core for this series and I have a 8723bs, 
>I can move the define to the core files in another patch series
>to add cfo support to 8723bs if Luka isn't already working on it.
>

I don't mind either approach, but why not move it to core file now, since
you plan to move it anyway and what seems more logical, doesn't it?

Also CFO suppost isn't in my plan right now, so if you want to implement
it, go ahead and I will be happy to assist you or co develop it(and review
it of course).

Best regards,
Luka Gejak
