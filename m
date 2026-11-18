Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007419;
	b=4cADWQmAs2Q1JioEK564+kBZMr+za+e1k79AoEO8aiQDroxoKdzkasDw/RALGoA1wM0W
	 iLES11KRp42KHwzOkVp7aURtZlV2RQe74ROx1VFumDimEOZj0SlUkAuwuROCLIIFYQn8d
	 iRzIwoBK+nJbIC2anMT4A8k5q4uqNBBGhgCStLoSZDfdzjfAjAKElq7qWKLuCuxE9dTsY
	 YvmPprC/5vnePNtQSI+an0a2U05K08qvj+jlYIgEimMpea8wvRh38lIhKlira394FnuFs
	 A3ueWAMpzn+6u3P3OOwljrm1fzUKEUNM6lkiNFiNHqHrI9YGoyESmVediEJ3l4XdvzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007419;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0srCo02Rm2nrJ/OxbxU648DIjt9+9+y8xYU1XDIc31U=;
	b=hKLEwH9DpFxCr32XUkLYJt6psmgAYz/uJjNXolhrQczNT4ZtafDlotBDvSJ9hbewRhai
	 PQDP7UtdJo+UK8YyPRfWqKxyBfoddCCfi4JT2Wk3I47PG6r5+WfX51G3M6zm0U7yequTv
	 fI/pFTOMMnvGw1LCL2iFFPR2aGYIRWVVzO0bZt21qd+NUb8lI9Z8kIt8ix08bs1gmDFCU
	 iMRBG/0ItAL5jKLhmFE+8e4UkVYiJFj9+wFfG3lM9Y7dd2E0RZmfjBsQTA94xF0oqKv6Z
	 kONzwtEKoc5Pt3ah0YrlfR6U/ZuMs875j1AlcCAC4JgWCSs5Ix9YGLdGQgwVN4kwdrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="SMVk8/U8";
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C5C606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 13:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C5C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SMVk8/U8
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0srCo02Rm2nrJ/OxbxU648DIjt9+9+y8xYU1XDIc31U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795007416; v=1; x=1795612216;
 b=SMVk8/U8UhE22TNOYgPWhX6bmrQQqen7EY2Aap11GwQxBeAWMbKngnH/QF8U0LgKKdK4Xp/R
 ZCA4zrEHRsHu4fru8hWqlx2tgYr0tLa1dC5bUEHgNL9YuhEIFWhHSvBct+TPyOMODs3DC+VOzHm
 7TPnRac09FY8fkbEH1duXue4=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 918bc269a2179b39;
	Wed, 18 Nov 2026 13:10:15 +0000
X-Mizu-Trace-ID: 918bc269a2179b39
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 14:10:10 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Po-Hao Huang <phhuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next=5D_wifi=3A_rtw88=3A_find_?=
 =?US-ASCII?Q?an_associated_station_without_allocating?=
In-Reply-To: <20261118104738.2020747-1-mehmet.fide@gmail.com>
References: <20261118104738.2020747-1-mehmet.fide@gmail.com>
Message-ID: <82D0B44A-7B20-4564-A368-5C834ADC6F8D@linux.dev>
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

On November 18, 2026 11:47:38 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>rtw_core_check_sta_active() collects the interfaces with
>rtw_iterate_vifs(), which allocates an entry per interface with
>GFP_ATOMIC and skips the interface when that fails. A station skipped
>this way counts as not active: on BSS_CHANGED_BSSID and in
>rtw_ops_stop_ap() rtw_clear_op_chan() then drops the operating channel
>saved for it, and a later hardware scan no longer goes back to that
>channel between the channels it scans.
>
>Both callers hold the wiphy mutex. Walk the active interfaces with
>for_each_active_interface(), which does not allocate.
>
>Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev/
>Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
