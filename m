Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995715;
	b=htnULoav64CAiFXnBXafeqDsPY79M5O4rrdmu4UuvyrsB/y0I8mdIrly3+WzhAdTWzX1
	 rXYrpEBq9Xk3fwd/IMpl4Tg18sWytqvbkGOBKdQb0WZrxpKwzXVSBEo8VNyQyvBi3CkQr
	 7tPYPMgSFP9VouJcXhHwrfyikWr+AAUugbLLIfcgJNGyjnOs5X88+qbrNwkQDozaa36X+
	 ZxE8B46OIzufR1cNPpoPerIKLs9xu1HU4by2aBrR6a8DiyoDpRphJh3/ggR+zwtUiB8rx
	 OtDvpnDbv2yD0VbFnxVfXD4ynYwMbyXrS2zDImI+tXYS40fjYpBgutzzOYGq0KBsytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995715;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=68aYgIeK1NKoIkVCvJO3EdG3lTe27tI30PqKaRlN81M=;
	b=E7k1Pyi1tMSMyQQBo3QZ3W2P1o61E39eVZ/S3VL9PaYdICW5jqEJmFDpSZmCUvE+qy7q
	 RcWcTAUSLTUWhrVMtUd0818xE8HkIOHGfZBjc9NRypvyEV/wdF1hVpKiavxm1DuQRGNVL
	 waBYEe2pc2JyEMaa4XhrJvMlZHrcn2aG9J1PqgolbCpCVF3fxI5We7VvY8GKVgNG9xZ0f
	 VMVfVFCFhA2iJLNXGWkb31suEuvm1hWe7mAqK6ik3IssUhmBjnCi5YVum8Ac4TbzmXiaj
	 mKgSOugN+ouS4/3NlIB+imiabXaxG014kiOTBdjPIOLeUQqb6FNLbyk//HgQ2wADEUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dhkOl1qb;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46C5606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 09:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dhkOl1qb
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tUna76zVsD0TwVxAAHPWMoClAbc3fRYk8TKbzG4ej/U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794995712; v=1; x=1795600512;
 b=dhkOl1qbFWOAtBnQUzCrMu7PJ+uWYllQQ6Fw60if40c6aFQ0artumbVGB2LNTMWB69Lszdtp
 tgzHfEzlvC+TVJbkIdolw9PMEWWk4BRjyKzHf/v3Zfoh3ctFWwpM2u0PAZEkR7VdsVitxcwGfK9
 lQPtyigd5GJOJRYR4t5/jokI=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9701b37f731648ef;
	Wed, 18 Nov 2026 09:55:11 +0000
X-Mizu-Trace-ID: 9701b37f731648ef
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 10:55:10 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Mehmet Fide <mehmet.fide@gmail.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev> <20261118083328.1984956-1-mehmet.fide@gmail.com> <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
Message-ID: <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev>
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

On November 18, 2026 10:14:17 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Mehmet Fide <mehmet.fide@gmail.com> wrote:
>> > I think the presence check is better fixed in
>> > rtw_core_check_sta_active(). Its callback only reads interface state,
>so
>> > could it use an atomic interface iterator without allocating entries?
>> 
>> Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
>> there. The check is older than this series: since commit 96fbb84de4ff
>> ("wifi: rtw88: handle station mode concurrent scan with AP mode") a
>> failed allocation also makes rtw_clear_op_chan() drop the operating
>> channel of an associated station, on BSS_CHANGED_BSSID and in
>> rtw_ops_stop_ap().
>> 
>> Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
>> a patch before this one in v13?
>
>I think rtw_core_check_sta_active() is used under wiphy lock, we can
>migrate to use for_each_active_interface() with lockdep_assert_wiphy()
>as a separate patch.
>

Works for me.

Best regards,
Luka Gejak
