Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063359;
	b=P6UTHwfWfOHMazaRHev4+SrczKfabpK28NaZD3zG9h6w4Uf0GbpelEyF9ewT9Oa/+EXs
	 tBLttFc1OKfds1Hvloev1U13z+4ZAkq/Zj4LrbVqQlnugBnmlczCwi3Ji9G1+xED5dl+Z
	 hMYB+k8pJatgls2a2D82K5hNHyUg8b6KCdC+gXF7lWpRaOK6N2c46sZBeVUf3OTlUE3Hu
	 PA/pGkZf2iTRPsRYjyUARCJLGm2dTaw6yWJErKLaC6UpxD6trbSoUvW6nfHRnFcSSHDXJ
	 F4nFV3SooG+dMZtZPA7eni77r4J/hPV5vCTsZdcLzf9GvWxUTHFauWR9x5rm5Jlmmiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063359;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zk9JOF8svvT2HGi6J4q/vmjJvEVsfSmVzwmFPVVSGu8=;
	b=q5M0IKlVMCuoL+qv6e7OvNP5R0luP63p4s+w4FbbYKJhIBDCx4L9LWmUJQav6RgPDawm
	 fEbxEkFQ02nnZsKeJKOna1/pI3fVux//Pt/UdNEwi8M2YLn7yB/VnK1yeY1tdoKcC1q4Z
	 R5SIrxjLRSo8US13Bar9EMr9/E2v4zFI20BWBjANudCynolyDjSsTPSZReuYAD4ly68V8
	 4gpXDLm3Tjy3FHMC0yMmH5AOC7n6B+UTb/sMf+Ouax7cx2AGCL3nUU4UpTG0mwq9c81Fj
	 tpQkLB3qP6UoClMVTABa3NOW+NY2OZBU78muBVJ+oqkPhbjgcANBxbr3bllAbjepAkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J02v7I1D;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D688E606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 04:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D688E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J02v7I1D
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=igL+GNlLs9K0x6iR7lEuZqZJTnk1fFTDBfsrbV2F6BA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795063356; v=1; x=1795668156;
 b=J02v7I1Dw6JczxlFSbJWrGrph+vISu7+WV++wheZXctBpmG8aq1DA0aga9a1uKRKaKd5hUNI
 reebXgz11q+IlTtZCfEjiYaxa8fYATevuGAEPj8mxrqBH4vle21ibz//6e8pDQ8xFn3Tn1FAtga
 6eP8PsZcwT3gVqeadxgAHt1s=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68d595ee228be766;
	Thu, 19 Nov 2026 04:42:36 +0000
X-Mizu-Trace-ID: 68d595ee228be766
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 05:42:32 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Mehmet Fide <mehmet.fide@gmail.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <9340ef0716924e229396aa1b595aa458@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev> <20261118083328.1984956-1-mehmet.fide@gmail.com> <d55a09e0accd42f39f476d3abba1cdca@realtek.com> <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev> <9340ef0716924e229396aa1b595aa458@realtek.com>
Message-ID: <7485BFDD-E895-4A73-AB29-8F3CB4712115@linux.dev>
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

On November 19, 2026 1:51:06 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> On November 18, 2026 10:14:17 AM GMT+01:00, Ping-Ke Shih
>> <pkshih@realtek.com> wrote:
>> >Mehmet Fide <mehmet.fide@gmail.com> wrote:
>> >> > I think the presence check is better fixed in
>> >> > rtw_core_check_sta_active(). Its callback only reads interface
>state,
>> >so
>> >> > could it use an atomic interface iterator without allocating
>entries?
>> >>
>> >> Right, the callback does not sleep, so rtw_iterate_vifs_atomic()
>works
>> >> there. The check is older than this series: since commit 96fbb84de4ff
>> >> ("wifi: rtw88: handle station mode concurrent scan with AP mode") a
>> >> failed allocation also makes rtw_clear_op_chan() drop the operating
>> >> channel of an associated station, on BSS_CHANGED_BSSID and in
>> >> rtw_ops_stop_ap().
>> >>
>> >> Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or
>as
>> >> a patch before this one in v13?
>> >
>> >I think rtw_core_check_sta_active() is used under wiphy lock, we can
>> >migrate to use for_each_active_interface() with lockdep_assert_wiphy()
>> >as a separate patch.
>> >
>> 
>> Works for me.
>
>Think more about failing to allocate. I suppose kernel will throw out
>a OOM message, so we can just handle the return NULL pointer to prevent
>crash. To ensure function still works as normal under OOM situation,
>it is not so easy. I guess we need to add many "special conditions",
>and driver becomes hard to read. 
>
>So, my opinion is to do our best to keep function work under OOM.
>No need to ensure everything work perfect. 

I agree. I think the benefit of handling an allocation failure needs to
justify the extra complexity. I'll keep that in mind in future reviews.

>For this case, it is not too hard to avoid the OOM case, so I agree
>the change. But we don't always need to handle the case found by LLM.
>

Do you mind explaining which LLM are you referring to? Perhaps sashiko?

Best regards,
Luka Gejak
