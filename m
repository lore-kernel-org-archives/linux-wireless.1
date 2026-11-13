Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529341;
	b=WMoHpP4zogtFREGBgRt8JcYze81FmF2a4WAB6Oymj6XZYopS2Zo6PxAFyu5NQ7j+XVdv
	 trRyBsgdYcXSyYq+xqLMJ2wxHWfJ3vpYlQQCE5vYj3DfT1VOSgWzKvaRA08xwmYI1N2AJ
	 qvy+O1K5GTgG0IVGKMvKQEJ7k/JR3TvL5lZJK4jDzqJ8at04J/mButYXSMaBzpln/wYF/
	 iJQZcHCGLIPJuEm1wNeF7LZSL2fN3KWLsfnhkPpjt+4b/cT75x1Ky+TVau3xdiUWc6D5i
	 BJpsdOG/AAe8327izuLUbWWjVu4llt0z//UwHzD5OBtrPuGneIa94adpMkdPhsn53nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529341;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FsO5xpItn+N7Qrtv37RVjeLHincPZrInK+ZtYC7OBpo=;
	b=znkEpU4IPUhA8neVGsvvMwkNxYnPlst2p5mk4XuHXiR/39OY7+CtID1h0PY748mWKrlY
	 0EUiOiwVPkTP2Tn27mSFcn389CXPQp+/yAD9MqE1waEmo99zcCDKrp+uOf+Yjdn/YOL4u
	 UdF99ZijOcxHr0UYqQmN95WAG4JkihdzYtT6smeUAUEowVlyJrlGhsfIsx30nMDfddFU5
	 cig5izFcIWE/MGtp2vNYS4bOU9Qy/pTN8EWPDuADUhpKk5t9ecIb0zHJYVUaDOgtAWVKK
	 M/J0jFNPGTAMm0ZzP7MqWDv3QTp3Be4VEhMTVxAfQfG5HZP6EAZiT7tVZYQrINBLXWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nw3IfceW;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CE606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nw3IfceW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794529341; x=1826065341;
  h=date:from:to:cc:subject:message-id;
  bh=N98IxRFDZcc1tanWDrCnW8POkh3gF1h+YO1KvebGCus=;
  b=Nw3IfceWTQ1yV/uM7bRNE4CuoT9LZ0RWQgEgHNxwMpUM7qOHYALbvPX6
   7z89By97u2jtGQUWMwCb1oDbkbtW16sEEaMLlQh9KAjzMdf1sogRA89ju
   ahd+ycP8Ga1N7e1cxcVlrAoqV/wnMKK5Im1BQGCW5iwgU8dYhnfTOlD9X
   11iqIBApA9YMf/Z6btOym51R4NiQo1etNSb6NUAy9nXzY9LO3ilPpfdum
   pt9RXKf3twimEQFw5tuh47GDEDgkXyelA/+sUx03BoxuB7tS3J/v0VY5T
   o27nr2wIRYHZyHI5YDSNu37B1mkWV30g1fE0vQZ7v5U+cxZiXMllWwn/r
   Q==;
X-CSE-ConnectionGUID: VDBxZUd7RIC2ycFTYOBeuA==
X-CSE-MsgGUID: yUiTjpiyRPOtvNtD4GbBAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3425907"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3425907"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:22:21 -0800
X-CSE-ConnectionGUID: HEt+92GqRHa+sayE5R7puw==
X-CSE-MsgGUID: CgG/dC7FQXWrQng4ew2lyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="9105432"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Nov 2026 16:22:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRf3Y-000000012DD-3uLx;
	Fri, 13 Nov 2026 00:22:16 +0000
Date: Fri, 13 Nov 2026 08:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org
Subject: [wireless:for-next] BUILD SUCCESS
 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
Message-ID: <20261113082136.oUBbsQY5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git for-next
branch HEAD: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5  Merge tag 'wireless-2026-11-11' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless

elapsed time: 975m

configs tested: 267
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             alldefconfig    gcc-16.2.0
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261112    clang-24
arc                   randconfig-1000-20261113    gcc-10.5.0
arc                   randconfig-1001-20261112    clang-24
arc                   randconfig-1001-20261113    gcc-10.5.0
arm                               alldefconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            imxrt_defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261112    clang-24
arm                   randconfig-1000-20261113    gcc-10.5.0
arm                   randconfig-1001-20261112    clang-24
arm                   randconfig-1001-20261113    gcc-10.5.0
arm                   randconfig-1002-20261112    clang-24
arm                   randconfig-1002-20261113    gcc-10.5.0
arm                   randconfig-1003-20261112    clang-24
arm                   randconfig-1003-20261113    gcc-10.5.0
arm                          s3c6400_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261112    gcc-14.4.0
arm64                 randconfig-1001-20261112    gcc-14.4.0
arm64                 randconfig-1002-20261112    gcc-14.4.0
arm64                 randconfig-1003-20261112    gcc-14.4.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261112    gcc-14.4.0
csky                  randconfig-1001-20261112    gcc-14.4.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261112    clang-24
hexagon               randconfig-1000-20261113    clang-24
hexagon               randconfig-1001-20261112    clang-24
hexagon               randconfig-1001-20261113    clang-24
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261112    clang-22
i386        buildonly-randconfig-1000-20261113    clang-22
i386        buildonly-randconfig-1001-20261112    clang-22
i386        buildonly-randconfig-1001-20261113    clang-22
i386        buildonly-randconfig-1002-20261112    clang-22
i386        buildonly-randconfig-1002-20261113    clang-22
i386        buildonly-randconfig-1003-20261112    clang-22
i386        buildonly-randconfig-1003-20261113    clang-22
i386        buildonly-randconfig-1004-20261112    clang-22
i386        buildonly-randconfig-1004-20261113    clang-22
i386        buildonly-randconfig-1005-20261112    clang-22
i386        buildonly-randconfig-1005-20261113    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261112    gcc-14
i386                  randconfig-1001-20261112    gcc-14
i386                  randconfig-1002-20261112    gcc-14
i386                  randconfig-1003-20261112    gcc-14
i386                  randconfig-1004-20261112    gcc-14
i386                  randconfig-1005-20261112    gcc-14
i386                  randconfig-1006-20261112    gcc-14
i386                  randconfig-1007-20261112    clang-22
i386                  randconfig-1007-20261113    clang-22
i386                  randconfig-1008-20261112    clang-22
i386                  randconfig-1008-20261113    clang-22
i386                  randconfig-1009-20261112    clang-22
i386                  randconfig-1009-20261113    clang-22
i386                  randconfig-1010-20261112    clang-22
i386                  randconfig-1010-20261113    clang-22
i386                  randconfig-1011-20261112    clang-22
i386                  randconfig-1011-20261113    clang-22
i386                  randconfig-1012-20261112    clang-22
i386                  randconfig-1012-20261113    clang-22
i386                  randconfig-1013-20261112    clang-22
i386                  randconfig-1013-20261113    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson64_defconfig    gcc-16.2.0
loongarch             randconfig-1000-20261112    clang-24
loongarch             randconfig-1000-20261113    clang-24
loongarch             randconfig-1001-20261112    clang-24
loongarch             randconfig-1001-20261113    clang-24
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5282evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         mvme147_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                       pic32mzda_defconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261112    clang-24
nios2                 randconfig-1000-20261113    clang-24
nios2                 randconfig-1001-20261112    clang-24
nios2                 randconfig-1001-20261113    clang-24
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261112    gcc-12.5.0
parisc                randconfig-1000-20261113    gcc-13.5.0
parisc                randconfig-1001-20261112    gcc-12.5.0
parisc                randconfig-1001-20261113    gcc-13.5.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                         icon_defconfig    gcc-16.2.0
powerpc                  mpc832x_rdb_defconfig    gcc-16.2.0
powerpc                       ppc64e_defconfig    gcc-16.2.0
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc                      rainier_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261112    gcc-12.5.0
powerpc               randconfig-1000-20261113    gcc-13.5.0
powerpc               randconfig-1001-20261112    gcc-12.5.0
powerpc               randconfig-1001-20261113    gcc-13.5.0
powerpc                  xes_mpc85xx_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261112    gcc-12.5.0
powerpc64             randconfig-1000-20261113    gcc-13.5.0
powerpc64             randconfig-1001-20261112    gcc-12.5.0
powerpc64             randconfig-1001-20261113    gcc-13.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261112    gcc-9.5.0
riscv                 randconfig-1000-20261113    gcc-12.5.0
riscv                 randconfig-1001-20261112    gcc-9.5.0
riscv                 randconfig-1001-20261113    gcc-12.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261112    gcc-9.5.0
s390                  randconfig-1000-20261113    gcc-12.5.0
s390                  randconfig-1001-20261112    gcc-9.5.0
s390                  randconfig-1001-20261113    gcc-12.5.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           kfr2r09_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261112    gcc-9.5.0
sh                    randconfig-1000-20261113    gcc-12.5.0
sh                    randconfig-1001-20261112    gcc-9.5.0
sh                    randconfig-1001-20261113    gcc-12.5.0
sh                           rsk7269_defconfig    gcc-16.2.0
sh                      sh7710voipgw_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261112    gcc-8.5.0
sparc                 randconfig-1000-20261113    gcc-8.5.0
sparc                 randconfig-1001-20261112    gcc-8.5.0
sparc                 randconfig-1001-20261113    gcc-8.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261112    gcc-8.5.0
sparc64               randconfig-1000-20261113    gcc-8.5.0
sparc64               randconfig-1001-20261112    gcc-8.5.0
sparc64               randconfig-1001-20261113    gcc-8.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261112    gcc-8.5.0
um                    randconfig-1000-20261113    gcc-8.5.0
um                    randconfig-1001-20261112    gcc-8.5.0
um                    randconfig-1001-20261113    gcc-8.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261112    gcc-14
x86_64      buildonly-randconfig-1000-20261113    clang-22
x86_64      buildonly-randconfig-1001-20261112    gcc-14
x86_64      buildonly-randconfig-1001-20261113    clang-22
x86_64      buildonly-randconfig-1002-20261112    gcc-14
x86_64      buildonly-randconfig-1002-20261113    clang-22
x86_64      buildonly-randconfig-1003-20261112    gcc-14
x86_64      buildonly-randconfig-1003-20261113    clang-22
x86_64      buildonly-randconfig-1004-20261112    gcc-14
x86_64      buildonly-randconfig-1004-20261113    clang-22
x86_64      buildonly-randconfig-1005-20261112    gcc-14
x86_64      buildonly-randconfig-1005-20261113    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261112    clang-22
x86_64                randconfig-1000-20261113    clang-22
x86_64                randconfig-1001-20261112    clang-22
x86_64                randconfig-1001-20261113    clang-22
x86_64                randconfig-1002-20261112    clang-22
x86_64                randconfig-1002-20261113    clang-22
x86_64                randconfig-1003-20261112    clang-22
x86_64                randconfig-1003-20261113    clang-22
x86_64                randconfig-1004-20261112    clang-22
x86_64                randconfig-1004-20261113    clang-22
x86_64                randconfig-1005-20261112    clang-22
x86_64                randconfig-1005-20261113    clang-22
x86_64                randconfig-1006-20261112    gcc-14
x86_64                randconfig-1006-20261113    clang-22
x86_64                randconfig-1007-20261112    gcc-14
x86_64                randconfig-1007-20261113    clang-22
x86_64                randconfig-1008-20261112    gcc-14
x86_64                randconfig-1008-20261113    clang-22
x86_64                randconfig-1009-20261112    gcc-14
x86_64                randconfig-1009-20261113    clang-22
x86_64                randconfig-1010-20261112    gcc-14
x86_64                randconfig-1010-20261113    clang-22
x86_64                randconfig-1011-20261112    gcc-14
x86_64                randconfig-1011-20261113    clang-22
x86_64                randconfig-1012-20261112    clang-22
x86_64                randconfig-1012-20261113    gcc-14
x86_64                randconfig-1013-20261112    clang-22
x86_64                randconfig-1013-20261113    gcc-14
x86_64                randconfig-1014-20261112    clang-22
x86_64                randconfig-1014-20261113    gcc-14
x86_64                randconfig-1015-20261112    clang-22
x86_64                randconfig-1015-20261113    gcc-14
x86_64                randconfig-1016-20261112    clang-22
x86_64                randconfig-1016-20261113    gcc-14
x86_64                randconfig-1017-20261112    clang-22
x86_64                randconfig-1017-20261113    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261112    gcc-8.5.0
xtensa                randconfig-1000-20261113    gcc-8.5.0
xtensa                randconfig-1001-20261112    gcc-8.5.0
xtensa                randconfig-1001-20261113    gcc-8.5.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
