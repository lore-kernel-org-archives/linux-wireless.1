Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205315;
	b=aLABsrF9I5GSorGetk2YMYXDtHQLVxYsVu1vJoJkzgzlW3AWkwxl/FRMkeljbJsMGoJZ
	 WRRtFKBvm25bi+sxYq70LV4hLJKxIkaHYkhJMre53MXaDY4GWT+OSUNGvLh2CFkwx+R2E
	 7MGLrFXATxGZsJp7CSL+vEAi4UMHUt+0VKmLeSb9dMm0iwGBR8C5kKjyudAc5ZaPz8QIw
	 mC3rLPeTKaaoWkOnnJX3p0GwQ0CGNETix1mdYnr/Xt8cF94K6ChqFcji39utColPgbzTD
	 HWikhdwix1ecgJwM8ZeBVRjmDLy/E8No/CJSy7NOfy/UlZk2kFy+Kcv7v2cdsf1pJ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205315;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X4oPqQzUTCF258jLwJeEbnqRkkLBozRE8pL/5tusbYg=;
	b=Y+VHxrKLdX6rwLZwYJRIUc8DTc9p1KAMAFTkQWFooVIpPwG0wNTKCYzAZmMw+6lRJicy
	 R7+4kOtExIyyDZmk7Eh1BjhjpCUfqwgZnCveF+ZBJdEiOUPHKdwaxzFofGu96oPAl3k+M
	 m8PiIMTlm8bLFvpvMf3jyGAX7D9wjlnWu/Hg5nEB+B8/hFaLFinV20cqLoBvFDxh3oXV4
	 m2Imvk0notES1/E3TCCu7ls0g8cOCv6zHEzMPBBvRRJRAYEYQylfsiI3r8gounq+qfTKi
	 svnV3KKot8V/Wc4QboA6gcFUCxS7V35v9jf6JdIhuCIpHPqVfTZvF6idOAy1YrtrcPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoiJvpCp;
	arc=none smtp.remote-ip=91.218.175.225
Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16169606A321
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 06:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16169606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GoiJvpCp
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MsYBkJeOLSfLNgzVOHX6M1aMi6+tZkDhL2lyZNSd2Y8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794205313; v=1; x=1794810113;
 b=GoiJvpCpgiAfmSVZlipl4wwZc2ZlBoOjRbb5Xa6TfSjFh9iVnnzFb8HDG1vZ/BmIwubONSyx
 9NQPdS15fZtT9GN4+ZqUJUt4UYdqfnM+Y6QCmjcDn/8hWY/MObP2CXTnc+6w0slhjdMy1K3dMa9
 AAifiaNTWSJg7gsFUYE4kkw4=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a5b9ee4d79ad13a;
	Mon, 09 Nov 2026 06:21:53 +0000
X-Mizu-Trace-ID: 1a5b9ee4d79ad13a
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 07:21:48 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Kalpesh Solanki <skalpesh942@gmail.com>
CC: "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v3_0/2=5D_wifi=3A_rtw88=3A_firmwa?=
 =?US-ASCII?Q?re_recovery_fixes_and_LPS_hang_handling?=
In-Reply-To: <86803b2c13a74ada92ab73e79f38164d@realtek.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com> <9fd1c42c5df94629a21c41dd08645b96@realtek.com> <27E9A60D-26F6-41D6-B74F-7DEF998C8498@linux.dev> <86803b2c13a74ada92ab73e79f38164d@realtek.com>
Message-ID: <B1CD522C-2CC2-4913-8175-05F0D25CF65F@linux.dev>
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

On November 9, 2026 7:12:52 AM GMT+01:00, Ping-Ke Shih <pkshih@realtek.com>
wrote:
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> On November 9, 2026 3:30:58 AM GMT+01:00, Ping-Ke Shih
><pkshih@realtek.com>
>> wrote:
>> >Kalpesh Solanki <skalpesh942@gmail.com> wrote:
>> >> Changes in v3:
>> >> - Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
>> >> - Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
>> >>   with Fixes tag.
>> >> - In patch 2/2:
>> >>   - Count consecutive failures before triggering recovery
>> >>     (RTW_PS_HANG_MAX_CNT = 3).
>> >>   - Reset ps_hang_cnt on successful LPS leave and in
>rtw_core_start().
>> >>   - Suppress raw register dump on transient failures to avoid log
>spam.
>> >
>> >The patchset doesn't present in [1] nor [2]. Please wait a while to
>send
>> >newer version after it recovered.
>> >
>> >[1] https://patchwork.kernel.org/project/linux-wireless/list/
>> >[2] https://lore.kernel.org/linux-wireless/
>> >
>> >
>> 
>> Hi Ping-Ke,
>> 
>> The linux-wireless list is bugged and nothing is appearing on it since
>> 2026-11-06 15:46 UTC. Aren't patches accessible due to
>> linux-kernel@vger.kernel.org being CC'ed?
>
>I think not. I sent patches to linux-wireless, not including linux-kernel,
>before, and the lore and patchwork of linux-wireless can capture the
>patches. 
>
>

We are having this conversation on linux-wireless, aren't we? I don't see
it and my lei isn't picking it up.


Best regards,
Luka Gejak
