Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880585;
	b=TB+JwxcDEtfYsSBaZl+m+kSn4SSQEM4u2GZrZmHlS+wndc5G17/UshN6zq4zBt/LjH+6
	 G6ApzdARpj1f66aL7UfqcdlqUXIBUbpZj0BtZg7af3gl1/a1t+7YM4ZQpCRzgNigM4VvS
	 3irKL9gh1PYYdDLTogE8Jcw3pxoNITNV/UGxdLsn2BLqJ6uVgUH3NIIgo0rkXTl/4pOwd
	 xgmEDLyFMuxxv/0eYvT1xpUfTWqPv5Ms3bf7zfQMwPxFLD/XRncgapH9bc0Pic1sxgM01
	 YAeZAQGabtFd2aU1B716k8rK+sXYY1zDoYtjpN6LektmiZUgk/u/JngCZfaz5kMLgMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880585;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hvmaGMAMpeG9tT9huYZwFxctZ9SlQrYQca0Ha5DzlD8=;
	b=IBNMamLHhTilGPG6JuptjQ15Gzp3gI04P0sd6SzidXTYUpStdG45Tspx/ycpfaBFtNKr
	 a9oQhPwsweT/jqAMumjiCyp2zC+TanvSSWY2NmIqdX8qpVlxPzpYSQlWc/WR78tZukxqU
	 DQ79q6ntOlOsQUZYFSmryALOW4bvU6OQZ1fMdSGcIjfpww2W7S6nrJ/kKqYofPqVTi4ST
	 JinvV/2o2TGHtfS1iMrp6fCSbBq2mydpIgH0BOBgqBYqvVRYh8UALDn8SoTbJNDwb/iOg
	 enHT/6UQotj1i1fH4rCSmG36JTTbCUSNWliMjU9FGyQmqpBbN6DxsxRRAQwOhnx9B+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oG+Iew+I;
	arc=none smtp.remote-ip=91.218.175.82
Received: from mta0.migadu.com (out-82.mta0.migadu.com [91.218.175.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18D8606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oG+Iew+I
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3Uw8zgzZOTHbbmMOZGlrXITxleM9dIolnYYvUisxBXU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880582; v=1; x=1796485382;
 b=oG+Iew+IZsbFhy0DRx2rNvGPIYjq3NZUhpg9GLnD/xnPNcdkDUfkfl46izpsdSTBSCfxD/O8
 i4D+8Xab0jzELjOs4BcmQOZmdL99UW4lfWZcpOKS/8Mej/3yWEhyuuSnga8yU+8uOxK4ubPg4br
 rBurTYpoBS9zxn5bL1/rnSv8=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c62133fbcd5ee46d;
	Sat, 28 Nov 2026 15:43:02 +0000
X-Mizu-Trace-ID: c62133fbcd5ee46d
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:42:57 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_6/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <CABOQOSVzi8rQk8GtKE9DL1GWz0VpEM3rfmDTpYy24HEyPGsG8g@mail.gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-7-hjf3108@gmail.com> <179586537111.18963.10245502413702250015.rtw88-v5-reply@linux.dev> <CABOQOSVzi8rQk8GtKE9DL1GWz0VpEM3rfmDTpYy24HEyPGsG8g@mail.gmail.com>
Message-ID: <68B406D1-643C-4CD1-AD77-70C665F3D509@linux.dev>
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

On November 28, 2026 4:36:59 PM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Sat, 28 Nov 2026 at 19:29, Luka Gejak <luka.gejak@linux.dev> wrote:
>>
>> Hi Jie Feng,
>>
>> Thanks for the update. Two comments below.
>>
>> On November 28, 2026 2:00:26 AM GMT+08:00, Ho Jie Feng
>> <hjf3108@gmail.com> wrote:
>>
>> > -     for (i = 0; i < rtwdev->hal.rf_path_num; i++) {
>> > +     for (i = 0; i < path_num; i++) {
>> >               cfo->cfo_tail[i] += pkt_stat->cfo_tail[i];
>> >               cfo->cfo_cnt[i]++;
>> >       }
>>
>> As far as I can see, RX can update these fields while the watchdog is
>> running rtw_phy_cfo_calc_avg(). It reads the sum and count separately,
>> then clears them in a second loop. A packet that arrives in between can
>> be counted against the wrong sum or cleared before it is used. That can
>> change the crystal adjustment even with a single peer.
>>
>> I think the same race exists on RTL8822C. Could we take and clear the
>> samples under the same lock as the RX updates before using the helper
>> on these chips?
>Yes, that makes sense. This could also be part of a CFO fixup patch
>series later? I don't want to unnecessarily bloat this patch series
>too much, and it currently doesn't change behaviour for RTL8822C.

Fine by me.

>
>> [ ... ]
>>
>> > +     bool bt_hold = rtwdev->efuse.btcoex &&
>!rtw_coex_disabled(rtwdev);
>> > +     u8 crystal_cap;
>> > +
>> > +     crystal_cap = rtw_phy_cfo_xcap_track(rtwdev, RTW_XCAP_MASK,
>bt_hold);
>>
>> So if I read it right, the helper returns the current cap when no new
>> CFO samples have arrived, before checking bt_hold. If the RTL8821AU
>> already adjusted the cap, a firmware report that Bluetooth is active
>> can set bt_hold while WiFi is idle. The cap then stays adjusted until
>> another CFO sample arrives. On 2.4 GHz the AP may only be sending CCK
>> beacons in the meantime, which this path doesn't sample.
>>
>> Could the Bluetooth check restore the efuse value even when the sample
>> count has not changed?
>This is also an existing bug in RTL8822C, so same as the above?
>

That works for me.

Best regards,
Luka Gejak
